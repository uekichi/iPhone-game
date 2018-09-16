//
//  GameScene.swift
//  omikuji
//
//  Created by ウエキチ on 2018/09/15.
//  Copyright © 2018年 ウエキチ. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    let mySprite = SKSpriteNode(imageNamed: "omikuji.png")
    let btnSprite = SKSpriteNode(imageNamed: "button.png")
    let myLabel = SKLabelNode(fontNamed: "Verdana-bold")
    
    override func didMove(to view: SKView) {
        self.backgroundColor = SKColor.white
        mySprite.position = CGPoint(x: 375, y: 900)
        addChild(mySprite)
        
        btnSprite.position = CGPoint(x: 375, y: 200)
        self.addChild(btnSprite)
        
        myLabel.text = "???"
        myLabel.fontColor = SKColor.black
        myLabel.fontSize = 65
        myLabel.position = CGPoint(x: 375, y: 500)
        self.addChild(myLabel)
    }
    
    func shakeOmikuji() {
        let action1 = SKAction.rotate(toAngle: -0.3, duration: 0.2)
        let action2 = SKAction.rotate(toAngle: 0.3, duration: 0.2)
        let action3 = SKAction.rotate(toAngle: 3.14, duration: 0.2)
        let actionS = SKAction.sequence([action1,action2,action1,action2,action1,action3])
        
        mySprite.run(actionS, completion: showOmikuji)
    }
    
    func showOmikuji() {
        let omikuji = ["大吉","中吉","吉","凶"]
        let r = Int(arc4random_uniform(4))
        myLabel.text = omikuji[r]
        
    }
    
    
    
    func touchDown(atPoint pos : CGPoint) {
    }
    
    func touchMoved(toPoint pos : CGPoint) {
    }
    
    func touchUp(atPoint pos : CGPoint) {
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches {
            let location = touch.location(in: self)
            let touchNode = self.atPoint(location)
            if touchNode == btnSprite {
                myLabel.text = "???"
                shakeOmikuji()
                
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
