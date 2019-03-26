library(JointNets)


### Name: F1.wsimule
### Title: computes F1 score for jointnet result
### Aliases: F1.wsimule

### ** Examples

library(JointNets)
simulationresult = simulation(p = 20,  n = c(100,100))
truth = simulationresult$simulatedgraphs
result = wsimule(simulationresult$simulatedsamples,
 0.2, 1, W = matrix(1,20,20), covType = "cov", FALSE)
F1(result,truth)



