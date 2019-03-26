library(StepSignalMargiLike)


### Name: est.mean.pois
### Title: est.mean.pois
### Aliases: est.mean.pois

### ** Examples

library(StepSignalMargiLike)

n <- 20
data.x <- rpois(n, 1)
data.x <- c(data.x, rpois(n, 10))
data.x <- c(data.x, rpois(n, 50))
data.x <- c(data.x, rpois(n, 20))
data.x <- c(data.x, rpois(n, 80))
data.x <- matrix(data.x,1)

prior <- c(1,2)
index.ChangePTs <- c(n, 2*n, 3*n, 4*n)
est.mean.pois(data.x, index.ChangePTs, prior)



