//
//  ViewController.swift
//  sumDemo
//
//  Created by darshan on 30/12/17.
//  Copyright © 2017 darshan. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate {
    @IBOutlet var tableVIew: UITableView!
    
    @IBOutlet var inputText: UITextField!
    
    var numberRows : Int = 0
    
   
   
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     if numberRows % 2 == 0
     {
        return numberRows/2
     }
     else
     {
        return numberRows/2 + 1  //number of cell we want
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
  
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TextInputTableViewCell
       
        let a : Int = indexPath.row
        
        
        cell.Label1.text = ""
        cell.Label2.text = ""
        cell.addButton.tag = indexPath.row
        cell.addButton.addTarget(self, action: #selector(addButton), for:UIControlEvents.touchUpInside)
        
        cell.Label1.text = String(2*a+1)
        
        if (2*a+2) <= numberRows
        {
            cell.Label2.text = String(2*a+2)
        }
   
     
            
            
            
    return cell
    }
    
    @IBAction func addButton(_ sender: UIButton) {
        
        print("button tapped\(sender.tag)")
        let cell = sender.superview?.superview as? TextInputTableViewCell
        
        var sum : Int?
        sum = 0
        
        func plus(a: Int, b: Int) ->Int {
            return a + b
        }
        
        sum = plus(a: Int((cell?.Label1.text!)!)!, b: Int((cell?.Label2.text!)!)!)
        print("sum is \(String(describing: sum!))")
        
        //creat alert
        let alert = UIAlertController(title:"sum of \(Int((cell?.Label1.text!)!)!) and \(Int((cell?.Label2.text!)!)!)",message:"\(sum!)",preferredStyle:UIAlertControllerStyle.alert)
        
        //add the action [three type of style all are here]
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        
        
        //show the alert
        present(alert, animated: true, completion: nil)
        
  
}

    override func viewDidLoad() {
        super.viewDidLoad()
        
         self.inputText.delegate = self
       
      
    }
    

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        //textField code
        numberRows = Int(inputText.text!)!
        inputText.resignFirstResponder()  //if desired
        tableVIew.reloadData()
        return true
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

