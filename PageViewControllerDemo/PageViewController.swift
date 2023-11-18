//
//  PageViewController.swift
//  PageViewControllerDemo
//
//  Created by Angelos Staboulis on 18/11/23.
//

import UIKit

class PageViewController: UIPageViewController,UIPageViewControllerDelegate,UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if index == viewControllersArray.count - 1  {
            index = 0
            return viewControllersArray[0]
        }else{
            index = index + 1
            return viewControllersArray[index]
        }
         
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if index == 0 {
            index = 1
            return viewControllersArray[1]
        }else{
            index = index - 1
            return viewControllersArray[index]
        }
       
    }
    var viewControllersArray:[UIViewController] = []
    var index:Int!=0
    override func viewDidLoad() {
        super.viewDidLoad()
        initialPageViewController()
        // Do any additional setup after loading the view.
    }
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return index
    }
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return viewControllersArray.count
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension PageViewController{
    func initialPageViewController(){
        self.delegate = self
        self.dataSource = self
        let redViewController =  self.storyboard?.instantiateViewController(withIdentifier: "RedViewController") as! RedViewController
        let greenViewController =
        self.storyboard?.instantiateViewController(withIdentifier: "GreenViewController") as! GreenViewController
        viewControllersArray.append(redViewController)
        viewControllersArray.append(greenViewController)
        if let vc = viewControllersArray.first {
            setViewControllers([vc], direction: .forward, animated: true)
        }
    }
}
