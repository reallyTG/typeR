library(spatstat)


### Name: dkernel
### Title: Kernel distributions and random generation
### Aliases: dkernel pkernel qkernel rkernel
### Keywords: methods nonparametric smooth

### ** Examples

  x <- seq(-3,3,length=100)
  plot(x, dkernel(x, "epa"), type="l",
           main=c("Epanechnikov kernel", "probability density"))
  plot(x, pkernel(x, "opt"), type="l",
           main=c("OptCosine kernel", "cumulative distribution function"))
  p <- seq(0,1, length=256)
  plot(p, qkernel(p, "biw"), type="l",
           main=c("Biweight kernel", "cumulative distribution function"))
  y <- rkernel(100, "tri")
  hist(y, main="Random variates from triangular density")
  rug(y)



