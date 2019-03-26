library(StepSignalMargiLike)


### Name: StepSignalMargiLike-package
### Title: Estimating Change Points Using Marginal Likelihood
### Aliases: StepSignalMargiLike-package StepSignalMargiLike

### ** Examples

n <- 5
data.x <- rnorm(n, 1, 1)
data.x <- c(data.x, rnorm(n, 10,1))
data.x <- c(data.x, rnorm(n, 2,1))
data.x <- c(data.x, rnorm(n, 10,1))
data.x <- c(data.x, rnorm(n, 1,1))
data.t <- 1:(5*n)

prior <- prior.norm.A(data.x)
max.segs <- 10

index.ChPT <- est.changepoints(data.x, mode="normal", prior)
est.mean <- est.mean.norm(data.x, index.ChPT, prior)
PlotChangePoints(data.x, data.t, index.ChPT, est.mean)

PlotChangePoints(data.x, data.t, index.ChPT, est.mean, type.data="p",
  col.data="green", col.est="black", main="Stepwise Signal Estimation",
  sub="Using Marginal Likelihood", xlab="time", ylab="value")



