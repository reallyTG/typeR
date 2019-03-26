library(maxLik)


### Name: summary.maxLik
### Title: summary the Maximum-Likelihood estimation
### Aliases: summary.maxLik coef.summary.maxLik
### Keywords: models

### ** Examples

## ML estimation of exponential distribution:
t <- rexp(100, 2)
loglik <- function(theta) log(theta) - theta*t
gradlik <- function(theta) 1/theta - t
hesslik <- function(theta) -100/theta^2
## Estimate with numeric gradient and hessian
a <- maxLik(loglik, start=1, control=list(printLevel=2))
summary(a)
## Estimate with analytic gradient and hessian
a <- maxLik(loglik, gradlik, hesslik, start=1, control=list(printLevel=2))
summary(a)



