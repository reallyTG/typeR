library(JointNets)


### Name: BIC
### Title: calculate BIC score for JointNets method
### Aliases: BIC

### ** Examples

library(JointNets)
simulateresult = simulation(p = 20,  n = c(100,100))
result = simule(simulateresult$simulatedsamples, 0.2, 0.5, covType = "cov", FALSE)
BIC(simulateresult$simulatedsamples,result)



