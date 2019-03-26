library(JointNets)


### Name: F1.fasjem
### Title: computes F1 score for jointnet result
### Aliases: F1.fasjem

### ** Examples

library(JointNets)
simulationresult = simulation(p = 20,  n = c(100,100))
truth = simulationresult$simulatedgraphs
result = fasjem(simulationresult$simulatedsamples, method = "fasjem-g", 2, 0.1, 0.1, 0.05, 20)
F1(result,truth)



