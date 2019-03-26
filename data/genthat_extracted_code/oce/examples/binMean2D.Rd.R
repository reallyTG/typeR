library(oce)


### Name: binMean2D
### Title: Bin-average f=f(x,y)
### Aliases: binMean2D

### ** Examples

library(oce)
x <- runif(500)
y <- runif(500)
f <- x + y
xb <- seq(0, 1, 0.1)
yb <- seq(0, 1, 0.2)
m <- binMean2D(x, y, f, xb, yb)
plot(x, y)
contour(m$xmids, m$ymids, m$result, add=TRUE, levels=seq(0, 2, 0.5), labcex=1)




