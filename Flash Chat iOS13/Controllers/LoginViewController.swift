//
//  LoginViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    

    @IBAction func loginPressed(_ sender: UIButton) {
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
              guard let strongSelf = self else { return }
              if let error {
                    print("Error signing in: \(error.localizedDescription)")
                  if error.localizedDescription.contains("malformed") {
                      let alert = UIAlertController(title: "Error", message: "You have entered an invalid email or password.", preferredStyle: .alert)
                      alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                  self?.present(alert, animated: true, completion: nil)
                  }
                     
                } else {
                    print("Signed in successfully")
                    strongSelf.performSegue(withIdentifier: "LoginToChat", sender: nil)
                }
            }
        }
    }
    
}
