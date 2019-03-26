library(maxLik)


### Name: logLik.maxLik
### Title: Return the log likelihood value
### Aliases: logLik.maxLik logLik.summary.maxLik
### Keywords: methods

### ** Examples

## ML estimation of exponential duration model:
t <- rexp(100, 2)
loglik <- function(theta) log(theta) - theta*t
gradlik <- function(theta) 1/theta - t
hesslik <- function(theta) -100/theta^2
## Estimate with analytic gradient and hessian
a <- maxLik(loglik, gradlik, hesslik, start=1)
## print log likelihood value
logLik( a )
## print log likelihood value of summary object
b <- summary( a )
logLik( b )



