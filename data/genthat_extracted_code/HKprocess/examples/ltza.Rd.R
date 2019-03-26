library(HKprocess)


### Name: ltza
### Title: Value of quadratic forms for the inverse of a symmetric positive
###   definite autocorrelation matrix.
### Aliases: ltza
### Keywords: array

### ** Examples

# Estimate the parameters for the Nile time series.

r <- acfHKp(H = 0.8,maxlag = length(Nile)-1)

examp <- ltza(r,Nile)

# Comparison of the algorithm with typical approaches

examp[1] - as.numeric(t(Nile) %*% solve(toeplitz(r)) %*% Nile)

examp[2] - as.numeric(t(rep(1,length(r))) %*% solve(toeplitz(r)) %*% Nile)

examp[3] - as.numeric(t(rep(1,length(r))) %*% solve(toeplitz(r)) %*%
rep(1,length(r)))

examp[4] - log(det(toeplitz(r)))



