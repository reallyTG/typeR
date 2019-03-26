library(EWGoF)


### Name: MEst
### Title: Moment Estimators of the two parameters of the Weibull
###   distribution
### Aliases: MEst
### Keywords: Moment estimators

### ** Examples

x <- rweibull(50,2,3)

Est <- MEst(x)

#Value of the moment estimator of the scale parameter
Est$eta

#Value of the moment estimator of the shape parameter
Est$beta



