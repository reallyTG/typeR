library(EWGoF)


### Name: LSEst
### Title: Least Squares Estimators of the two parameters of the Weibull
###   distribution
### Aliases: LSEst
### Keywords: Liao-shimokawa Least squares estimators

### ** Examples

x <- rweibull(50,2,3)

Est <- LSEst(x)

#Value of the least squares estimator of the scale parameter
Est$eta

#Value of the lest squares estimator of the shape parameter
Est$beta



