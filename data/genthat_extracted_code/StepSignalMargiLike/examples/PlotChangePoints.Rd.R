library(StepSignalMargiLike)


### Name: PlotChangePoints
### Title: PlotChangePoints
### Aliases: PlotChangePoints

### ** Examples

library(StepSignalMargiLike)

n <- 5
data.x <- rnorm(n, 1, 1)
data.x <- c(data.x, rnorm(n, 10,1))
data.x <- c(data.x, rnorm(n, 2,1))
data.x <- c(data.x, rnorm(n, 10,1))
data.x <- c(data.x, rnorm(n, 1,1))
data.x <- matrix(data.x, 1)
data.t <- 1:(5*n)

index.ChPT <- c(n,2*n,3*n,4*n)
est.mean <- c(1,10,2,10,2)
PlotChangePoints(data.x, data.t, index.ChPT, est.mean)

PlotChangePoints(data.x, data.t, index.ChPT, est.mean, type.data="p",
  col.data="green", col.est="black", main="Stepwise Signal Estimation",
  sub="Using Marginal Likelihood", xlab="time", ylab="value")



