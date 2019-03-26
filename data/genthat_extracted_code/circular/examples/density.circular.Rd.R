library(circular)


### Name: density.circular
### Title: Kernel Density Estimation for Circular Data
### Aliases: density.circular print.density.circular
### Keywords: distribution smooth

### ** Examples

x <- rvonmises(n=100, mu=circular(pi), kappa=2)
res25 <- density(x, bw=25, control.circular=list(units="degrees"))
circularp(res25$x)
plot(res25, points.plot=TRUE, xlim=c(-1.6,1))
res50 <- density(x, bw=25, adjust=2)
lines(res50, col=2)
lines(res50, col=3, shrink=0.9) #shrink the plot wrt the function :-)
lines(res50, col=4, offset=0.5) #draw it with a reference circle of 0.5 



