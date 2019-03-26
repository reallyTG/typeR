library(StepSignalMargiLike)


### Name: est.mean.norm
### Title: est.mean.norm
### Aliases: est.mean.norm

### ** Examples

library(StepSignalMargiLike)

n <- 5
data.x <- rnorm(n, 1, 1)
data.x <- c(data.x, rnorm(n, 10,1))
data.x <- c(data.x, rnorm(n, 2,1))
data.x <- c(data.x, rnorm(n, 10,1))
data.x <- c(data.x, rnorm(n, 1,1))

prior <- prior.norm.A(data.x)
index.ChPT <- c(n,2*n,3*n,4*n)
est.mean.norm(data.x, index.ChPT, prior)



