library(EWGoF)


### Name: BLOMEst
### Title: Blom's estimators of the two parameters of the Weibull
###   distribution
### Aliases: BLOMEst
### Keywords: Blom's estimators linear unbiased estimators

### ** Examples

x <- rweibull(50,2,3)

#Value of the Blom's estimator of the scale parameter
BLOMEst(x)$eta

#Value of the Blom's estimator of the shape parameter
BLOMEst(x)$beta




