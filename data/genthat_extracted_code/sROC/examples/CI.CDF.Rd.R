library(sROC)


### Name: CI.CDF
### Title: Pointwise Confidence Intervals for Kernel Smooth CDF
### Aliases: CI.CDF
### Keywords: smoothing

### ** Examples


set.seed(100)
n <- 200
x <- c(rnorm(n/2, mean=-2, sd=1), rnorm(n/2, mean=3, sd=0.8))
x.CDF <- kCDF(x)
x.CDF
CI.CDF(x.CDF)
plot(x.CDF, alpha=0.05, main="Kernel estimate of distribution function")
curve(pnorm(x, mean=-2, sd=1)/2 + pnorm(x, mean=3, sd=0.8)/2, from =-6, to=6, add=TRUE, lty=2, col="blue")




