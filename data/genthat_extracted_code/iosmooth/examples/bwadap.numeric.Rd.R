library(iosmooth)


### Name: bwadap.numeric
### Title: Adaptive bandwidth choice for infinite order density estimates
### Aliases: bwadap.numeric
### Keywords: Flat-top kernel Density estimate

### ** Examples

x <- rnorm(100)
bwplot(x)
h <- bwadap(x)
plot(iodensity(x, h, kernel="Trap"), type="l")
rug(x)
# Add the truth in red
xs <- seq(-3, 3, len=1000)
lines(xs, dnorm(xs), col="red")



