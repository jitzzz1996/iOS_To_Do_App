//
//  ViewController.swift
//  iOS_To_Do_App
//
//  Created by jitesh bablani on 23/12/21.
//

import UIKit

class ToDoListViewController: UITableViewController {

    var listData = ["abc","def","ghi"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listData.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoListCell", for: indexPath)
        cell.textLabel?.text = listData[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }

    @IBAction func addItemAction(_ sender: Any) {
        var newItemtextField: UITextField?
        let alert = UIAlertController(title: "Add new To Do item", message: "", preferredStyle: .alert)
        alert.addTextField { alertTextField in
            alertTextField.placeholder = "Create New Item"
            newItemtextField = alertTextField
        }
        let action = UIAlertAction(title: "Add Item", style: .default) { buttonAction in
            self.listData.append(newItemtextField?.text ?? "")
            self.tableView.reloadData()
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}

