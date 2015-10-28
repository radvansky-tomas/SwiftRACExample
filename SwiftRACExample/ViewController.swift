//
//  ViewController.swift
//  SwiftRACExample
//
//  Created by Tomas Radvansky on 28/10/2015.
//  Copyright © 2015 Radvansky.Tomas. All rights reserved.
//

import UIKit
import ReactiveCocoa

class ViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.rac_textSignal().map({ (text:AnyObject!) -> AnyObject! in
            let castedString:String = text as! String
            if (castedString == "1234")
            {
                return "valid"
            }
            else
            {
                return castedString
            }
        }).filter({ (text:AnyObject!) -> Bool in
            let castedString:String = text as! String
            if castedString.characters.count > 3
            {
                return true
            }
            else
            {
                return false
            }
        }).subscribeNext { (id:AnyObject!) -> Void in
            print(id)
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

