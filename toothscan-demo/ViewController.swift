//
//  ViewController.swift
//  toothscan-demo
//
//  Created by Shivam Rawat on 09/04/24.
//

import UIKit
import SwiftUI
import toothscan_sdk_ios

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapOnButton(_ sender: Any) {
    
        class theme: IToothScanTheme {
            var primaryColor: Color = .blue
            var secondaryColor: Color = .yellow
            var accentColor: Color = .red
            var fontFamily: String =  "MagicMonolines"
        }
        
        class secrets: IToothScanSecrets {
            var partnerID: String = "partnerId"
            var userID: String? = "userId"
            var partnerSecret: String = "partnerSecret"
        }
        
        class config: IToothScanConfigs {
            var secrets: IToothScanSecrets?
            var theme: IToothScanTheme?
            init(secrets: IToothScanSecrets?, theme: IToothScanTheme?) {
                self.secrets = secrets
                self.theme = theme
            }
        }
        
        let toothscan = try? ToothScanSdk(config: config(secrets: secrets(), theme: theme()))
        if let toothscan {
            toothscan.displaySurvey()
        }
    }

}

