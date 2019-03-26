library(simsem)


### Name: findIndResidualVar
### Title: Find indicator residual variances from factor loading matrix,
###   total factor covariance, and total indicator variances.
### Aliases: findIndResidualVar

### ** Examples

loading <- matrix(0, 6, 2)
loading[1:3, 1] <- c(0.6, 0.7, 0.8)
loading[4:6, 2] <- c(0.6, 0.7, 0.8)
facCov <- matrix(c(1, 0.5, 0.5, 1), 2, 2)
totalVar <- rep(1, 6)
findIndResidualVar(loading, facCov, totalVar)



