library(JointNets)


### Name: F1.diffeek
### Title: computes F1 score for jointnet result
### Aliases: F1.diffeek

### ** Examples

library(JointNets)
simulationresult = simulation(p = 20,  n = c(100,100))
truth = simulationresult$simulatedgraphs
result = diffeek(simulationresult$simulatedsamples[[1]],
simulationresult$simulatedsamples[[2]],
W = matrix(1,20,20), g = rep(0,20),epsilon = 0.2,
lambda = 0.4,covType = "cov")
F1(result,truth)



