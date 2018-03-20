//
//  HomeViewController.swift
//  iPark
//
//  Created by Johan BRUNET on 10/03/2018.
//  Copyright © 2018 Jade HENNEBERT. All rights reserved.
//

import UIKit

class HomeViewController:UIViewController {
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    override func viewDidLoad() {
        let patientDAO: PatientDAO = CoreDataDAOFactory.getInstance().getPatientDAO()
        let patient: PatientModel
        do {
            patient = try patientDAO.get()!
            usernameLabel.text = "Bonjour " + patient.prenom + " " + patient.nom
        }
        catch {
            let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
            let nav = storyboard.instantiateViewController(withIdentifier: "firstLaunchView") as! FirstLaunchViewController
            self.present(nav, animated: true, completion: nil)
        }
    }
}
