library(StepSignalMargiLike)


### Name: est.changepoints
### Title: est.changepoints
### Aliases: est.changepoints

### ** Examples

library(StepSignalMargiLike)

n <- 5
data.x <- rnorm(n, 1, 1)
data.x <- c(data.x, rnorm(n, 10,1))
data.x <- c(data.x, rnorm(n, 2,1))
data.x <- c(data.x, rnorm(n, 10,1))
data.x <- c(data.x, rnorm(n, 1,1))

prior <- prior.norm.A(data.x)
max.segs <- 10

est.changepoints(data.x=data.x, model="normal", prior=prior)
est.changepoints(data.x=data.x, model="normal", prior=prior, max.segs=max.segs)
est.changepoints(data.x=data.x, model="normal", prior=prior, max.segs=max.segs,logH=TRUE)



