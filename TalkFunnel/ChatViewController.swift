//
//  ChatViewController.swift
//  TalkFunnel
//
//  Created by Jaison Titus on 11/08/15.
//  Copyright © 2015 Hasgeek. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!
    var finishedLoadingPage: Bool = true
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        loadPage()
    }
    
    func loadPage() {
        webView.delegate = self
        let requestURL = NSURL(string: "https://scrollback.io/hasgeek")
        let request = NSURLRequest(URL: requestURL!)
        webView.loadRequest(request)
    }
    
    func webViewDidStartLoad(webView: UIWebView) {
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        finishedLoadingWebView()
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        print("WebView error is \(error)")
        if finishedLoadingPage == false {
            loadPage()
        }
    }
    
    func finishedLoadingWebView() {
        self.finishedLoadingPage = true
    }
    
}
