library(NNS)


### Name: PM.matrix
### Title: Partial Moment Matrix
### Aliases: PM.matrix
### Keywords: covariance moments, partial

### ** Examples

set.seed(123)
x <- rnorm(100) ; y <- rnorm(100) ; z <- rnorm(100)
A <- cbind(x,y,z)
PM.matrix(LPM.degree = 1, UPM.degree = 1, target = "mean", variable = A)

## Calling Individual Partial Moment Quadrants
cov.mtx = PM.matrix(LPM.degree = 1, UPM.degree = 1, target = "mean", variable = A)
cov.mtx$cupm

## Full covariance matrix
cov.mtx$matrix



