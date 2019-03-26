library(RobExtremes)


### Name: QuantileBCCEstimator
### Title: Function to compute QuantileBCC estimates for the Weibull Family
### Aliases: QuantileBCCEstimator .QBCC
### Keywords: univar

### ** Examples

## (empirical) Data
set.seed(123)
distroptions("withgaps"=FALSE)
x <- rweibull(50, scale = 0.5, shape = 3)
##
QuantileBCCEstimator(x = x)



