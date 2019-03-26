library(DistributionUtils)


### Name: distStepSize
### Title: Step Size for Calculating the Range of a Unimodal Distribution
### Aliases: distStepSize
### Keywords: distribution univar

### ** Examples

normRange <- distCalcRange("norm", tol = 10^(-7), mean = 4, sd = 1)
normRange
tRange <- distCalcRange("t", tol = 10^(-5), df = 4)
tRange



