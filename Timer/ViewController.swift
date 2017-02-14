import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    
    var timer: Timer!
    var timer_sec: Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
            }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func updateTimer(timer: Timer){
        self.timer_sec += 0.1
        self.timerLabel.text = String(format: "%.1f", timer_sec)
    }

    @IBAction func startTimer(_ sender: Any) {
        if self.timer == nil {
        self.timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        } else {
            self.timer.invalidate()
            self.timer = nil            
        }

    }
    
    @IBAction func pauseTimer(_ sender: Any) {
        if self.timer != nil {
            self.timer.invalidate()
            self.timer = nil
        }
    }
    
    @IBAction func resetTimer(_ sender: Any) {
        self.timer_sec = 0
        self.timerLabel.text = String(format: "%.1f", self.timer_sec)
        
        if self.timer != nil{
            self.timer.invalidate()
            self.timer = nil
        }
    }
    
}

