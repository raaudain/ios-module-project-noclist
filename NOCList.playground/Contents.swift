/*:
# Module Project - NOC List

Greetings agent. Your mission is a top priority for the agency. Please read below for further info.

Our undercover agents in Eastern Europe are in trouble. The NOC list (Non-official cover) has been leaked and we need our directors to have quick access to the information so we can try to mitigate the damage. Some of the agents on the list have an access level that makes them privy to very sensitive information. We need an application that will present the NOC list's information in a quickly digestible format. Our top agents have been working on it, but we need this done ASAP and you've proven yourself to be quite capable of a quick turnaround.

The Director herself has given you access to all the agency's resources to complete this mission. We're counting on you agent.

Here is the complete NOC List. This information is classified at the highest levels, so guard it very carefully.

 ---
 
 * coverName: "Ethan Hunt", realName: "Tom Cruise", accessLevel: 8, compromised: false
 * coverName: "Jim Phelps", realName: "Jon Voight", accessLevel: 9, compromised: true
 * coverName: "Claire Phelps", realName: "Emmanuelle Beart", accessLevel: 5, compromised: false
 * coverName: "Eugene Kittridge", realName: "Henry Czerny", accessLevel: 10, compromised: true
 * coverName: "Franz Krieger", realName: "Jean Reno", accessLevel: 4, compromised: false
 * coverName: "Luther Stickell", realName: "Ving Rhames", accessLevel: 4, compromised: false
 * coverName: "Sarah Davies", realName: "Kristin Scott Thomas", accessLevel: 5, compromised: true
 * coverName: "Max RotGrab", realName: "Vanessa Redgrave", accessLevel: 4, compromised: false
 * coverName: "Hannah Williams", realName: "Ingeborga Dapkūnaitė", accessLevel: 5, compromised: true
 * coverName: "Jack Harmon", realName: "Emilio Estevez", accessLevel: 6, compromised: true
 * coverName: "Frank Barnes", realName: "Dale Dye", accessLevel: 9, compromised: false
 
 ---

This message will self destruct in 5 seconds.
*/
//: ## Step 1
//: Create constants for each of the above agents and store all their information in a tuple.

let agent01 = (coverName: "Ethan Hunt", realName: "Tom Cruise", accessLevel: 8, compromised: false)
let agent02 = (coverName: "Jim Phelps", realName: "Jon Voight", accessLevel: 9, compromised: true)
let agent03 = (coverName: "Claire Phelps", realName: "Emmanuelle Beart", accessLevel: 5, compromised: false)
let agent04 = (coverName: "Eugene Kittridge", realName: "Henry Czerny", accessLevel: 10, compromised: true)
let agent05 = (coverName: "Franz Krieger", realName: "Jean Reno", accessLevel: 4, compromised: false)
let agent06 = (coverName: "Luther Stickell", realName: "Ving Rhames", accessLevel: 4, compromised: false)
let agent07 = (coverName: "Sarah Davies", realName: "Kristin Scott Thomas", accessLevel: 5, compromised: true)
let agent08 = (coverName: "Max RotGrab", realName: "Vanessa Redgrave", accessLevel: 4, compromised: false)
let agent09 = (coverName: "Hannah Williams", realName: "Ingeborga Dapkūnaitė", accessLevel: 5, compromised: true)
let agent10 = (coverName: "Jack Harmon", realName: "Emilio Estevez", accessLevel: 6, compromised: true)
let agent11 = (coverName: "Frank Barnes", realName: "Dale Dye", accessLevel: 9, compromised: false)

//: ## Step 2
//: Place the above constants inside an array. Declare this array as a constant as well.

let agents = [agent01, agent02, agent03, agent04, agent05, agent06, agent07, agent08, agent09, agent10, agent11]

//: ## Step 3
//: Create a function that calculates the total number of compromised agents. Inside the function, iterate over the array of agents to determine which ones are compromised. Return the total count.

func compromised() -> Int {
    var count = 0

    for agent in agents {
        if (agent.compromised) {
            count += 1
        }
    }

    return count
}

compromised()

//: ## Step 4
//: Call the above function to find the total number of compromised agents and then print a sentence that says "# agents have been compromised!" using string interpolation.

print("\(compromised()) agents have been compromised!")

//: ## Step 5
//: Create a function called "findCleanAgents" that both prints the cover names of all uncompromised agents, as well as returns an array of agents that are uncompromised.

func findCleanAgents() -> Array<String> {
    var clean = [String]()
    
    for agent in agents {
        if (!agent.compromised) {
            print(agent.coverName)
            clean.append(agent.coverName)
        }
    }
    
    return clean
}

findCleanAgents()

//: ## Step 6
//: Call the above function to find the total number of clean agents and print a message that says "# clean agents out of # total agents." Use the total number of agents in the array from step 2 as the second number in the string.

print("\(findCleanAgents().count) clean agents out of \(agents.count) total agents.")

//: ## Step 7
//: Create a function called "findHighRisk" that prints out the real names and access levels of agents with level 8 or higher. If one of these agents is also currently compromised, add `**WARNING** **COMPROMISED**` to the end of the string that includes their name and access level.
//: - Example: `Jon Voight, level: 9 **WARNING** **COMPROMISED**`

func findHighRisk() {
    for agent in agents {
        if (agent.compromised && agent.accessLevel >= 8) {
            print("\(agent.realName), level: \(agent.accessLevel) **WARNING** **COMPROMISED**")
            
        }
        else if (agent.accessLevel >= 8) {
            print("\(agent.realName), level: \(agent.accessLevel)")
        }
    }
}


//: ## Step 8
//: Call the above function and check the output in the console to ensure it is functioning properly.

findHighRisk()

//: ## Step 9
//: Create a function that finds totals for low, mid, and high level agents. Low level agents are 4 or lower, mid are 5-7, and high level agents are 8 or above. Iterate over each agent and use a `switch` statement to determine their level group. At the end of the function, print a statement like the following: "# low level agents, # mid level agents, and # high level agents"

func levels() {
    var low = 0
    var mid = 0
    var high = 0
    
    for agent in agents {
        switch agent.accessLevel {
        case 5...7:
            mid += 1
        case 8...:
            high += 1
        default:
            low += 1
        }
    }
    
    print("\(low) low level agents, \(mid) mid level agents, and \(high) high level agents")
}


//: ## Step 10
//: Call the above function and check its output in the console.

levels()

//: ## Step 11 (Optional)
//: Create and call a function that prints the cover names and access levels of all agents, but the list should be sorted by access level, in ascending order.

func sort() {
    var arr = [Any]()

    for agent in agents {
        
        arr.append((agent.coverName, agent.accessLevel))
    }
    

    
    //print(arr)
}

sort()
