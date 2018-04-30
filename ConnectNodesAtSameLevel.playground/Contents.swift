//: Playground - noun: a place where people can play

import UIKit

class LinkedListNode<T> {
    let value: T
    var next: LinkedListNode<T>?
    
    init(_ value: T) {
        self.value = value
    }
}

class LinkedList<T>: CustomStringConvertible {
    typealias Node = LinkedListNode<T>
    
    var head: Node?
    var tail: Node?

    init() {}
    
    init(array: [T]) {
        assert(array.count > 0)
        for element in array {
            addNew(element)
        }
    }
    
    func addNew(_ value: T) {
        let newNode = Node(value)
        
        if (head == nil) {
            head = newNode
            tail = newNode
        } else {
            tail?.next = newNode
            tail = newNode
        }
    }
    
    func removeHead() -> T? {
        let tmpHead = head
        head = tmpHead?.next
        
        return tmpHead?.value
    }
    
    var description: String {
        guard let h = head else { return "" }
        
        var node = h
        var result = "\(node.value)"
        
        while let nextNode = node.next {
            result += " -> \(nextNode.value)"
            node = nextNode
        }
        
        return result
    }
}

//let list = LinkedList<String>(array: ["a", "b", "c", "d"])
//print(list)
//list.removeHead()
//print(list)
//

class Queue<T> {
    let linkedList = LinkedList<T>()
    init() {}
    
    func enqueue(value: T) {
        linkedList.addNew(value)
    }
    
    func dequeue() -> T? {
        return linkedList.removeHead()
    }
}


class BTNode: CustomStringConvertible {
    let data: Int
    var left: BTNode?
    var right: BTNode?
    var next: BTNode?

    init(_ data: Int) {
        self.data = data
    }

    var description: String {
        return "\(data)"
    }
}

func connect(_ node: BTNode) {
//    var nextLevelQueue = Queue<BTNode>()
    
    var queue = Queue<BTNode>()
    queue.enqueue(value: node)
    
    var currentNode = queue.dequeue()

    while let n = currentNode {
        let nextNode = queue.dequeue()
        n.next = nextNode
        
        if let l = n.left {
            queue.enqueue(value: l)
        }
        if let r = n.right {
            queue.enqueue(value: r)
        }

        if nextNode != nil {
            currentNode = nextNode
        }
        else {
            currentNode = queue.dequeue()
        }
    }
}

let root = BTNode(1)
let two = BTNode(2)
let three = BTNode(3)

root.left = two
root.right = three

let four = BTNode(4)
let five = BTNode(5)
two.left = four
two.right = five


let six = BTNode(6)
let seven = BTNode(7)
three.left = six
three.right = seven

connect(root)

var tmpNode:BTNode? = two

while tmpNode != nil {
    print("\(tmpNode!.data)")
    tmpNode = tmpNode!.next
}

