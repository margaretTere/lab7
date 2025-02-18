//
//  ViewController.swift
//  lab7
//
//  Created by Margaret T on 2025-02-17.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   

    @IBOutlet weak var txtNumber: UITextField!
    private var dicResult: [Int: Int] = [:]
    
    @IBOutlet weak var lblError: UILabel!
    
    @IBOutlet weak var tblResult: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblResult.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        // Do any additional setup after loading the view.
        tblResult.delegate = self
        tblResult.dataSource = self
    }


    @IBAction func calculate(_ sender: Any) {
        let number = convertStringToInt(txtNumber.text)
        
        if number == nil{
            lblError.text = "Please enter a valid integer number"
            txtNumber.text = ""
        } else{
            lblError.text = ""
            txtNumber.text = ""
            
            if dicResult.keys.contains(number!){
                dicResult[number!]! += 1
            }else{
                dicResult[number!] = 1
            }
            tblResult.reloadData()
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dicResult.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let keyArray = Array(dicResult.keys)[indexPath.row]
        let pathValue = dicResult[keyArray]!
        
        cell.textLabel?.text = "\(keyArray): \(pathValue)"
        return cell
    }
    
    
    func convertStringToInt(_ str: String?) -> Int? {
        return Int(str!)
    }
}

