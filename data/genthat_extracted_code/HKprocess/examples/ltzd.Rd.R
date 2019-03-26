library(HKprocess)


### Name: ltzd
### Title: Value of quadratic forms for the inverse of a symmetric positive
###   definite autocorrelation matrix.
### Aliases: ltzd
### Keywords: array

### ** Examples

# Estimate the parameters for the Nile time series.

r <- acfHKp(H = 0.8,maxlag = length(Nile)-1)

examp <- ltzd(r,Nile)

# Comparison of the algorithm with typical approaches

examp - as.numeric(t(Nile) %*% solve(toeplitz(r)) %*% Nile)



