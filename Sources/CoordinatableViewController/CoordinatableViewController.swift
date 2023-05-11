import UIKit.UIViewController

open class CoordinatableViewController: UIViewController {

    // MARK: - Public properties

    public var onCompleted: (() -> Void)?

    // MARK: - View lifecycle

    public override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

        if let navigationController = navigationController {
            if !navigationController.viewControllers.contains(self) {
                onCompleted?()
            }
        } else if isParentless {
            onCompleted?()
        }
    }
}

public extension UIViewController {

    var isParentless: Bool {
        parent == nil && presentingViewController == nil && UIApplication.shared.keyWindow?.rootViewController != self
    }
}
