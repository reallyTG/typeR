library(JointNets)


### Name: F1.diffee
### Title: computes F1 score for jointnet result
### Aliases: F1.diffee

### ** Examples

library(JointNets)
simulationresult = simulation(p = 20,  n = c(100,100))
truth = simulationresult$simulatedgraphs
result = diffee(simulationresult$simulatedsamples[[1]],
simulationresult$simulatedsamples[[2]], 0.01)
F1(result,truth)



