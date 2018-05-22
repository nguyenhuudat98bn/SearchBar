//
//  TableViewController.swift
//  SearchBarByHEHE
//
//  Created by nguyễn hữu đạt on 5/18/18.
//  Copyright © 2018 nguyễn hữu đạt. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    var big0Team = ["A LUYEN", "DAT","A NGOC A","HUY","HEHE" ]
    var big0 = [String]()
    var isSearchActive : Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearchActive {
            return big0.count
        } else {
            return big0Team.count
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if isSearchActive {
            cell.textLabel?.text = big0[indexPath.row]
        } else {
            cell.textLabel?.text = big0Team[indexPath.row]
        }
        return cell
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        big0 = searchText.isEmpty ? [] : big0Team.filter {(item : String) -> Bool in
            item.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil }
        tableView.reloadData()
    }
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        isSearchActive = true
    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        isSearchActive = false
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearchActive = false
    }

}
