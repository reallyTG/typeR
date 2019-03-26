library(maxLik)


### Name: vcov.maxLik
### Title: Variance Covariance Matrix of maxLik objects
### Aliases: vcov.maxLik
### Keywords: methods

### ** Examples

## ML estimation of exponential random variables
t <- rexp(100, 2)
loglik <- function(theta) log(theta) - theta*t
gradlik <- function(theta) 1/theta - t
hesslik <- function(theta) -100/theta^2
## Estimate with numeric gradient and hessian
a <- maxLik(loglik, start=1, control=list(printLevel=2))
vcov(a)
## Estimate with analytic gradient and hessian
a <- maxLik(loglik, gradlik, hesslik, start=1)
vcov(a)



