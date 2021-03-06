import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!

    var countries = [
        "estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria",
        "poland", "russia", "spain", "uk", "us"
    ]

    let hints = [
        "estonia": "Vanilla Ninja",
        "france" : "baguette",
        "germany": "Rammstein",
        "ireland": "Braveheart",
        "italy"  : "Luca Turilli",
        "monaco" : "Napoleon Museum",
        "nigeria": "Things Fall Apart",
        "poland" : "lelelelele",
        "russia" : "dancing man",
        "spain"  : "nobody expects",
        "uk"     : "tea",
        "us"     : "FREEDOM"
    ]

    var buttons = [UIButton]()

    var correctAnswer = 0
    var score = 0

    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()

        //button1.setImage(UIImage(named: countries[0]), for: .normal)
        //button2.setImage(UIImage(named: countries[1]), for: .normal)
        //button3.setImage(UIImage(named: countries[2]), for: .normal)

        buttons.enumerated().forEach({ index, button in
            button.setImage(UIImage(named: countries[index]), for: .normal)
        })

        correctAnswer = Int.random(in: 0 ... 2)
        //title = countries[correctAnswer].uppercased()
        let hint = hints[countries[correctAnswer]] ?? "something is wrong"

        title = "Hint: \(hint)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Guess the FREEDOM flag"
        buttons = [button1, button2, button3]

        buttons.forEach({ button in
            button.layer.cornerRadius = 4
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.lightGray.cgColor
        })

        askQuestion()
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        if correctAnswer == sender.tag {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong"
            score -= 1
        }

        let alertController = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(alertController, animated: true)
    }
}
