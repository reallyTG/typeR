library(JointNets)


### Name: F1
### Title: Compute F1 score for JointNets result
### Aliases: F1

### ** Examples

library(JointNets)
simulationresult = simulation(p = 20,  n = c(100,100))
truth = simulationresult$simulatedgraphs
result = simule(simulationresult$simulatedsamples, 0.2, 0.5, covType = "cov", FALSE)
F1(result,truth)



