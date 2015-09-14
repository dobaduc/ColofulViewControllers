import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var redContainer: ViewControllerContainer!
    @IBOutlet weak var greenContainer: ViewControllerContainer!
    @IBOutlet weak var blueContainer: ViewControllerContainer!

    var redViewController: RedViewController?
    var greenViewController: GreenViewController?
    var blueViewController: BlueViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        redViewController = storyBoard.instantiateViewControllerWithIdentifier("RedViewController") as? RedViewController
        redViewController?.attachToContainer(redContainer)

        greenViewController = storyBoard.instantiateViewControllerWithIdentifier("GreenViewController") as? GreenViewController
        greenViewController?.attachToContainer(greenContainer)

        blueViewController = storyBoard.instantiateViewControllerWithIdentifier("BlueViewController") as? BlueViewController
        blueViewController?.attachToContainer(blueContainer)    }
}

class ColorfulViewController: UIViewController {
    weak var container: ViewControllerContainer?

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.frame = CGRect(origin: view.frame.origin, size: view.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize))
        container?.heightConstraint.constant = view.frame.height
    }

    func attachToContainer(container: ViewControllerContainer) {
        self.container = container
        container.addSubview(view)
        view.frame = container.bounds
    }
}

class ViewControllerContainer: UIView {
    // Connect all container's height constraints to this IBOutlet
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
}

// Set class name of the containers to these classes
class RedViewController: ColorfulViewController {}
class GreenViewController: ColorfulViewController {}
class BlueViewController: ColorfulViewController {}