library(HARModel)


### Name: HARsimulate
### Title: HAR simulation
### Aliases: HARsimulate
### Keywords: HAR simulation

### ** Examples

set.seed(123)
#Simulate the process of size 10000
HARSim = HARsimulate(iLength=10000, vLags = c(1, 5, 22),
vCoef = c(0.002, 0.36 ,0.28 , 0.28), dSigma = 0.001)
#plot the Object
plot(HARSim)



