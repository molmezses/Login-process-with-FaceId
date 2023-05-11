//
//  ViewController.swift
//  FaceRecognition
//
//  Created by mustafa ölmezses on 11.05.2023.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {
    

    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func signInClicked(_ sender: Any) {
        
        let authContext = LAContext()
        
        var error : NSError?
        
        //Biotmetrik değer var mı
        
        if authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
            
            //biometrik değeri doğrula
            
            authContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Is it you?") { success, error in
                
                if success == true {
                    DispatchQueue.main.async { //arka planda çalıştır ki işlemler çakışıp app çökmesin
                        self.performSegue(withIdentifier: "toSecondVC", sender: nil)

                    }
                    
                }else{
                    
                    DispatchQueue.main.async { //arka planda çalıştır ki işlemler çakışıp app çökmesin
                        
                        self.myLabel.text = "Error"
                        
                    }
                }
                
            }
            
            
        }
        
        
    }
    
}

