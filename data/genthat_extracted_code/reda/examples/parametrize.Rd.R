library(reda)


### Name: parametrize
### Title: Parametrizations of Covariates and Covariate Coefficients
### Aliases: parametrize

### ** Examples

## time points
timeVec <- c(0.5, 2)
## time-variant covariates
zMat <- cbind(0.5, ifelse(timeVec > 1, 1, 0))
## time-varying coefficients
zCoefMat <- cbind(sin(timeVec), timeVec)

## the following three ways are equivalent for the exponential form,
## where the first one (using the built-in option) has the best performance
parametrize(zMat, zCoefMat, FUN = "exponential")
parametrize(zMat, zCoefMat, function(z, zCoef) exp(z %*% zCoef))
sapply(1 : 2, function(i) as.numeric(exp(zMat[i, ] %*% zCoefMat[i, ])))




