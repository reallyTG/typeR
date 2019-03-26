library(HKprocess)


### Name: ltzb
### Title: Value of quadratic forms for the inverse of a symmetric positive
###   definite autocorrelation matrix.
### Aliases: ltzb
### Keywords: array

### ** Examples

# Estimate the parameters for the Nile time series.

r <- acfHKp(H = 0.8,maxlag = length(Nile)-1)

examp <- ltzb(r,Nile)
# Comparison of the algorithm with typical approaches

examp[1] - as.numeric(t(rep(1,length(r))) %*% solve(toeplitz(r)) %*% Nile)

examp[2] - as.numeric(t(rep(1,length(r))) %*% solve(toeplitz(r)) %*%
rep(1,length(r)))



