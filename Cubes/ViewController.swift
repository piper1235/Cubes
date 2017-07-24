//
//  ViewController.swift
//  Cubes
//
//  Created by Tony on 7/24/17.
//  Copyright © 2017 Anthony Vitrano. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var cubes : [Cube] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            cubes = try context.fetch(Cube.fetchRequest())
            tableView.reloadData()
        } catch {
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cubes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let cube = cubes[indexPath.row]
        cell.textLabel?.text = cube.title
        cell.imageView?.image = UIImage(data: cube.image as! Data)
        return cell
    }
    
    }




