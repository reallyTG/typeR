library(HARModel)


### Name: HARestimate
### Title: HAR estimation
### Aliases: HARestimate

### ** Examples

set.seed(123)
#Simulate a HAR process:
HARSim = HARsimulate(iLength = 10000, 
vLags = c(1,5,22), vCoef = c(0.5, 0.36 , 0.28 , 0.28 ))
#Estimate the HAR process:
HARModel = HARestimate(vRealizedMeasure = HARSim@Simulation,
vLags = c(1,5,22))



