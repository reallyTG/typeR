library(sROC)


### Name: kCDF
### Title: Kernel Estimation for Cumulative Distribution Function
### Aliases: kCDF
### Keywords: nonparametric smooth distribution function estimation

### ** Examples


## --------------------
set.seed(100)
n <- 200
x <- c(rnorm(n/2, mean=-2, sd=1), rnorm(n/2, mean=3, sd=0.8))
x.CDF <- kCDF(x)
x.CDF
plot(x.CDF, alpha=0.05, main="Kernel estimate of distribution function", CI=FALSE)
curve(pnorm(x, mean=-2, sd=1)/2 + pnorm(x, mean=3, sd=0.8)/2, from =-6, to=6, add=TRUE, lty=2, col="blue")




