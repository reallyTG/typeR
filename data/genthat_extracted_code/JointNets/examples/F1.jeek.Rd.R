library(JointNets)


### Name: F1.jeek
### Title: computes F1 score for jointnet result
### Aliases: F1.jeek

### ** Examples

library(JointNets)
simulationresult = simulation(p = 20,  n = c(100,100))
truth = simulationresult$simulatedgraphs
result = jeek(simulationresult$simulatedsamples,0.25,covType = "kendall",parallel = FALSE)
F1(result,truth)



