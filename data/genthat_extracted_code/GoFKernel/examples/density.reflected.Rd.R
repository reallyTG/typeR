library(GoFKernel)


### Name: density.reflected
### Title: Kernel Density Estimation with Reflection
### Aliases: density density.reflected
### Keywords: density

### ** Examples

set.seed(234)
x <- runif(2000)
dx <- density.reflected(x,0,1)

## Plot of the density estimate with and without reflection
par(mfcol=c(1,2))
plot(dx, xlim=c(-0.1,1.1), ylim=c(0,1.1))
abline(h=1, col="red")

plot(density(x), xlim=c(-0.1,1.1), ylim=c(0,1.1))
abline(h=1, col="blue")



