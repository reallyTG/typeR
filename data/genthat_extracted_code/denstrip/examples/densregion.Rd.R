library(denstrip)


### Name: densregion
### Title: Density regions
### Aliases: densregion densregion.default
### Keywords: aplot color

### ** Examples

## Predictive uncertainty around a hypothetical regression line

x <- 1:10
nx <- length(x)
est <- seq(0, 1, length=nx)
lcl <- seq(-1, 0, length=nx)
ucl <- seq(1, 2, length=nx)
se <- (est - lcl)/qnorm(0.975)

y <- seq(-3, 3, length=100)
z <- matrix(nrow=nx, ncol=length(y))
for(i in 1:nx)
  z[i,] <- dnorm(y, est[i], se[i])
plot(x, type="n", ylim=c(-5.5, 2.5))
densregion(x, y, z, colmax="darkgreen")
lines(x, est)
lines(x, lcl, lty=2)
lines(x, ucl, lty=2)
box()

## On graphics devices that support transparency, specify
## colmin="transparent" to allow adjacent regions to overlap smoothly
densregion(x, y-1, z, colmax="magenta", colmin="transparent")

## Don't show: 
densregion(x, y, z, nlevels=20, colmax="darkgreen")
densregion(x, y, z, scale=0.5, colmax="darkmagenta", contour=TRUE)
## End(Don't show)
## or automatically choose the y points to evaluate the density 

plot(x, type="n", ylim=c(-1.5, 2.5))
densregion.normal(x, est, se, ny=50, colmax="darkgreen")
lines(x, est)
lines(x, lcl, lty=2)
lines(x, ucl, lty=2)



