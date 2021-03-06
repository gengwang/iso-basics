/*:
 [Previous](@previous) | [Next](@next)
 ****
 # Drawing: A Green Circle
 
 The basic way of custom drawing with [Core Graphics](https://developer.apple.com/reference/coregraphics#overview) is to override the UIView's `draw(_ rect:)` method, or to draw on a CAShapeLayer object and add them to the layer of your custom view.
 
 See [WWDC 2014: What's New in IB](https://developer.apple.com/videos/play/wwdc2014/411/)
 
 */
//MARK: Setup playground

import UIKit
import PlaygroundSupport

let containerView = UIView(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 300, height: 300)))
containerView.backgroundColor = UIColor.gray

PlaygroundPage.current.liveView = containerView

//MARK: custom view

class MyCircle: UIView {
    
    let lineWidth: CGFloat = 10.0
    
    private func setup() {
        // To clear the default black background, set the background color property to the "clear" color or isOpaque to false.
//        self.backgroundColor = UIColor.clear
        self.isOpaque = false
    }
    // Implements draw(_ rect:) method
    override func draw(_ rect: CGRect) {
        let rect = rect.insetBy(dx: lineWidth/2.0, dy: lineWidth/2.0)
        let path = UIBezierPath(ovalIn: rect)
        path.lineWidth = lineWidth
        UIColor.green.setStroke()
        path.stroke()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
}

//MARK: Main

let w = CGFloat(88.0)
let h = CGFloat(88.0)
let x = (containerView.bounds.width - w) / 2
let y = (containerView.bounds.width - h) / 2

let circle = MyCircle(frame: CGRect(x: x, y: y, width: w, height: h))

containerView.addSubview(circle)

/*:
 ****
 [Previous](@previous) | [Next](@next)
 */
