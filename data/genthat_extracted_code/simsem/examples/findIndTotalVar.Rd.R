library(simsem)


### Name: findIndTotalVar
### Title: Find indicator total variances from factor loading matrix, total
###   factor covariance, and indicator residual variances.
### Aliases: findIndTotalVar

### ** Examples

loading <- matrix(0, 6, 2)
loading[1:3, 1] <- c(0.6, 0.7, 0.8)
loading[4:6, 2] <- c(0.6, 0.7, 0.8)
facCov <- matrix(c(1, 0.5, 0.5, 1), 2, 2)
resVar <- c(0.64, 0.51, 0.36, 0.64, 0.51, 0.36)
findIndTotalVar(loading, facCov, resVar)



