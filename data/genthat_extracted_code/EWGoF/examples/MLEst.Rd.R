library(EWGoF)


### Name: MLEst
### Title: Maximum Likelihood Estimators of the two parameters of the
###   Weibull distribution
### Aliases: MLEst
### Keywords: Maximum likelihood estimators

### ** Examples

x <- rweibull(50,2,3)

Est <- MLEst(x)

#Value of the maximum likelihood estimator of the scale parameter
Est$eta

#Value of the maximum likelihood estimator of the shape parameter
Est$beta



