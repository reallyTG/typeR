library(partialAR)


### Name: loglik.par
### Title: Negative log likelihood of a partially autoregressive fit
### Aliases: loglik.par
### Keywords: ts models

### ** Examples

loglik.par(0,0,0,1)  # -> same as -log(dnorm(0))
loglik.par(0,0,1,0)  # -> same as -log(dnorm(0))
loglik.par(0,0,1,1)  # -> same as -log(dnorm(0,0,sqrt(2)))



