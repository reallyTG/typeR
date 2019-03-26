library(HKprocess)


### Name: ltzc
### Title: Value of quadratic forms for the inverse of a symmetric positive
###   definite autocorrelation matrix.
### Aliases: ltzc
### Keywords: array

### ** Examples

# Estimate the parameters for the Nile time series.

r <- acfHKp(H = 0.8,maxlag = length(Nile)-1)

examp <- ltzc(r,Nile)

# Comparison of the algorithm with typical approaches

examp[1] - as.numeric(t(Nile) %*% solve(toeplitz(r)) %*% Nile)

examp[2] - log(det(toeplitz(r)))



