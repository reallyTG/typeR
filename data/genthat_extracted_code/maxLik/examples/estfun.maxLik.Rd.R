library(maxLik)


### Name: estfun.maxLik
### Title: Extract Gradients Evaluated at each Observation
### Aliases: estfun.maxLik
### Keywords: methods

### ** Examples

## ML estimation of exponential duration model:
t <- rexp(100, 2)
loglik <- function(theta) log(theta) - theta*t

## Estimate with numeric gradient and hessian
a <- maxLik(loglik, start=1 )

# Extract the gradients evaluated at each observation
library( sandwich )
head(estfun( a ), 10)

## Estimate with analytic gradient.
## Note: it returns a vector
gradlik <- function(theta) 1/theta - t
b <- maxLik(loglik, gradlik, start=1)
head(estfun( b ), 10)



