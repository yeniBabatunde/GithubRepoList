//
//  BaseViewController.swift
//  GithubProfiles
//
//   Created by Sharon Omoyeni Babatunde on 01/01/2025.
//

import UIKit

class BaseViewController: UIViewController {
    
    var progressIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        return activityIndicator
    }()
    
    var views: [UIView] { [] }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        setObservers()
        view.backgroundColor = .white
    }
    
    func configureViews() {}
    
    func createProgressBar() {
        view.addSubview(progressIndicator)
        progressIndicator.frame = CGRect(x: 0, y: 0, width: 500, height: 500)
        progressIndicator.hidesWhenStopped = true
        progressIndicator.center = view.center
        if #available(iOS 13.0, *) {
            progressIndicator.color = .systemBlue
            progressIndicator.style = .large
        }
    }
    
    func showLoading() {
        hideLoading()
        createProgressBar()
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.progressIndicator.startAnimating()
            self.views.forEach {
                $0.isUserInteractionEnabled = false
                $0.alpha = 0.85
            }
        }
    }
    
    func hideLoading() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.progressIndicator.stopAnimating()
            self.views.forEach {
                $0.isUserInteractionEnabled = true
                $0.alpha = 1
            }
        }
    }
    
    func setupNavBarColor() {
        if let navigationController = navigationController {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor.systemBlue
            appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            
            navigationController.navigationBar.standardAppearance = appearance
            navigationController.navigationBar.scrollEdgeAppearance = appearance
            navigationController.navigationBar.compactAppearance = appearance
            navigationController.navigationBar.tintColor = .white
        }
    }
    
    func setObservers() {
        setChildViewControllerObservers()
    }
    
    func setChildViewControllerObservers() {}
    
}
