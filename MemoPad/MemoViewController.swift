//
//  MemoViewController.swift
//  MemoPad
//
//  Created by まゆり吉積 on 2018/06/27.
//  Copyright © 2018年 まゆり吉積. All rights reserved.
//

import UIKit

class MemoViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var contenTextView: UITextView!
    
    
    
    var saveDate : UserDefaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleTextField.text = saveDate.object(forKey: "title") as? String
        contenTextView.text = saveDate.object(forKey: "content") as? String
        titleTextField.delegate = self
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func saveMemo() {
        //UserDefaultsに書き込み
        saveDate.set(titleTextField.text, forKey: "title")
        saveDate.set(contenTextView.text, forKey: "content")
        
        //alertを出す
        let alert: UIAlertController = UIAlertController(title: "保存", message: "メモの保存が完了しました。",preferredStyle: .alert)
        
        
        //OKボタン
        alert.addAction(UIAlertAction(
            title: "OK",
            style: .default,
            handler: { action in
                //ボタンが押された時の動作
                self.navigationController?.popViewController(animated: true)
                print ("OKボタンが押されました！")
        }
                )
                )
                
                present(alert, animated: true, completion: nil)
        }
        
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
