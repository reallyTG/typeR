library(HARModel)


### Name: SandwichNeweyWest
### Title: HAC Variance Covariance Matrix For 'HARModel' Objects
### Aliases: SandwichNeweyWest

### ** Examples

set.seed(123)
#Simulate a HAR process:
HARSim = HARsimulate(iLength = 10000, 
vLags = c(1,5,22), vCoef = c(0., 0.36 , 0.28 , 0.28 ) 
, dSigma = 0.001)
#Estimate the HAR process:
HARModel = HARestimate(vRealizedMeasure = HARSim@Simulation,
vLags = c(1,5,22))

SandwichNeweyWest(HARModel , lags = 5)



