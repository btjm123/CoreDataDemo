//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by roycetanjiashing on 5/11/16.
//  Copyright © 2016 examplecompany. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        let car = Car(context:context)
        
        car.brand = "BMW"
        car.type = "Coupe"
        
        appDelegate.saveContext()
        
        do {
            let result = try context.fetch(Car.fetchRequest())
            
            let cars = result as! [Car]
            
            for car in cars {
                print("Brand: \(car.brand)")
                print("Type: \(car.type)")
            }
        } catch {
            print("Error")
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

