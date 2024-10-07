//
//  ViewController.swift
//  Morgage Calculator
//
//  Created by Katie Pambakian on 30/01/2022.
//

import UIKit

class ViewController: UIViewController {
    
    // enter lone amount
    @IBOutlet weak var loneAmountTxt: UITextField!
    
    // years to repay
    @IBOutlet weak var yearsToRepayTxt: UITextField!
    
    // interest per year
    @IBOutlet weak var interestPerYeartxt: UITextField!
    
    // display label
    @IBOutlet weak var displayLbl: UILabel!
    
    @IBOutlet weak var labelLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        displayLbl.text = ""
        labelLbl.text = ""
    }
    
    // calculate button
    @IBAction func calculatebtn(_ sender: Any) {
        // gets the numbers from the user screen
        let LoneAmount = Double(loneAmountTxt.text!)!
        
        let YearsToRepay = Double(yearsToRepayTxt.text!)!
        
        let IntrestPerYear = Double(interestPerYeartxt.text!)!
        
        
        // gets the interst rate per month
        let numMonths = YearsToRepay * 12
    
        let monthlyMultiplyer = (pow((IntrestPerYear/100)+1, (1/12)))
        let monthlyInterestRate = (monthlyMultiplyer-1)
        
        let totalAmount = LoneAmount * pow(monthlyMultiplyer, numMonths)
        
        let lamba = (1/monthlyInterestRate)
        
        
        //times lamba to the monthlyinterest to the power of the number of months
        let temp = (-(lamba) * pow(monthlyMultiplyer,numMonths))
        
        //addes togther lamba by the temp
        let temp2 = temp + lamba
        
        
        //calculates the final amount needed to pay each month
        var amount = totalAmount/(-(temp2))
        
        // round to 2 dp
        amount = Double(round(amount * 100)/100.0)
        displayLbl.text = "£ \(amount)"
        
        if (amount >= 3000){
            labelLbl.text = ("Woo thats a lot of money")
        } else if (amount >= 2000){
            labelLbl.text = ("That quite a lot")
        } else if (amount >= 1000){
            labelLbl.text = ("Thats seems to be about average")
        } else{
            labelLbl.text = ("Thats resonable")
        }
        
    }
    @IBAction func confettibtn(_ sender: Any) {

    }
    
}

