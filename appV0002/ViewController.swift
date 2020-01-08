//
//  ViewController.swift
//  appV0002
//
//  Created by Zach mills on 10/1/19.
//  Copyright © 2019 Zach mills. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
//
    var row0Item: ChecklistItem
//    create initializer
    required init?(coder aDecoder: NSCoder) {
        row0Item = ChecklistItem()
        row0Item.text = "Take a jog"
        super.init(coder: aDecoder)
//        passes in the decoder
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath)
        
        if let label = cell.viewWithTag(1000) as? UILabel {
            
            if indexPath.row == 0 {
                label.text = row0Item.text
//      using checklist items text
            
         
            } else if indexPath.row % 4 == 0 {
                               label.text = "chill!"
            } else if indexPath.row % 3 == 0 {
                                          label.text = "code an app!"
            } else if indexPath.row % 2 == 0 {
                                              label.text = "study!"
            } else if indexPath.row % 1 == 0 {
                                          label.text = "walk the dog!"
            
            
            
            
            }
            
        }
        configureCheckMark(for: cell, at: indexPath)
        
        return cell
    }
    
    //    make checkmark disappear, use delegate method
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        //        get current cell using address, indexpath is that address
        
        if let cell = tableView.cellForRow(at: indexPath) {
            // returns an optional cell incase there isnt one at that address
            configureCheckMark(for: cell, at: indexPath)
            
            tableView.deselectRow(at: indexPath, animated: true)
            
                // this will eliminate cell highlighting after touch. Highlight will only indicate touch and not remain when deselected
            
            }
        }
//    passing in a cell, and index path, 
    func configureCheckMark(for cell: UITableViewCell, at indexPath: IndexPath) {
        if indexPath.row == 0 {
                        if row0Item.checked {
        //    when user taps cell, display check according to if its true or false
                            cell.accessoryType = .none
                        } else {
                            cell.accessoryType = .checkmark
                        }
                        row0Item.checked = !row0Item.checked
        //                sets state of checkmark to inverse state (not checked (!))
                    } else {
                    if cell.accessoryType == .none {
                        // check accessory type
                        cell.accessoryType = .checkmark }
                            // if accessory type is none, set to checkmark
                    else {
                                
                        cell.accessoryType = .none
                                // otherwise, remove checkmark
                    }
    }
        
        
        
    }
        
    
}


