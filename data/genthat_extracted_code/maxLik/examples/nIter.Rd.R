library(maxLik)


### Name: nIter
### Title: Return number of iterations for iterative models
### Aliases: nIter nIter.default
### Keywords: methods

### ** Examples

## Estimate the exponential distribution parameter:
t <- rexp(100, 2)
loglik <- function(theta) sum(log(theta) - theta*t)
## Estimate with numeric gradient and numeric Hessian
a <- maxNR(loglik, start=1)
nIter(a)



