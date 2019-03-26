library(circular)


### Name: lines.density.circular
### Title: Add a Plot for Kernel Density Estimation for Circular Data
### Aliases: lines.density.circular
### Keywords: dplot

### ** Examples

set.seed(1234)
x <- rvonmises(n=100, mu=circular(pi), kappa=2)
y <- rvonmises(n=100, mu=circular(pi/2), kappa=2)
resx <- density(x, bw=25)
res <- plot(resx, points.plot=TRUE, xlim=c(-1.5,1), ylim=c(-1.1, 1.5))
resy <- density(y, bw=25)
lines(resy, points.plot=TRUE, col=2, points.col=2, plot.info=res)



