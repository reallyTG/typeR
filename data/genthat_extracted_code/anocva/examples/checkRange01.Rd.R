library(anocva)


### Name: checkRange01
### Title: Check for 0,1 Interval Normalization.
### Aliases: checkRange01

### ** Examples

set.seed(2000)

simuData = runif(100, min = 0.5, max=7)
sprintf("The minimum value is %.2f and the maximum is %.2f.", min(simuData), max(simuData))

simuData = checkRange01(simuData)
sprintf("Now the minimum value is %.2f and the maximum is %.2f.", min(simuData), max(simuData))




