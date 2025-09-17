//
//  ViewController.swift
//  AlarmClock
//
//  Created by 이제민 on 9/17/25.
//

import UIKit

class ViewController: UIViewController {
    var alarmTime: Date?
    let timeSelector: Selector = #selector(updatetime)
    let interval = 1.0
    
    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblPickerTime: UILabel!
    @IBOutlet var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
        
        lblPickerTime.text = "알람 시간을 설정하시오."
        
        datePicker.addTarget(self, action: #selector(changeDatePicker(_:)), for: .valueChanged)
    }
    
    @objc func updatetime() {
        let date = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        lblCurrentTime.text = "현재 시간: " + formatter.string(from: date as Date)
        
        if let alarm = alarmTime {
            let currentString = formatter.string(from: date as Date)
            let alarmString = formatter.string(from: alarm)
            
            if currentString == alarmString {
                view.backgroundColor = UIColor.red
            } else {
                view.backgroundColor = UIColor.white
            }
        }
    }
    
    @objc func changeDatePicker(_ sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        alarmTime = sender.date
        lblPickerTime.text = "알람 시간: " + formatter.string(from: alarmTime!)
    }

}

