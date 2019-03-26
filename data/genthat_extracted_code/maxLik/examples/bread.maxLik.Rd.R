library(maxLik)


### Name: bread.maxLik
### Title: Bread for Sandwich Estimator
### Aliases: bread.maxLik
### Keywords: methods

### ** Examples

## ML estimation of exponential duration model:
t <- rexp(100, 2)
loglik <- function(theta) log(theta) - theta*t

## Estimate with numeric gradient and hessian
a <- maxLik(loglik, start=1 )

# Extract the "bread"
library( sandwich )
bread( a )

all.equal( bread( a ), vcov( a ) * nObs( a ) )



