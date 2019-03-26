library(SIBER)


### Name: pointsToEllipsoid
### Title: Test whether a set of points are inside or outside a defined
###   ellipse
### Aliases: pointsToEllipsoid

### ** Examples

X <- matrix(runif(200,-2.5, 2.5), ncol = 2, nrow = 100)
SIG <- matrix(c(1,0,0,1), ncol = 2, nrow = 2)
mu <- c(0, 0)
Z <- pointsToEllipsoid(X, SIG, mu)
test <- ellipseInOut(Z, p = 0.95)
plot(X, col = test + 1, xlim = c(-3, 3), ylim = c(-3, 3), asp = 1)
addEllipse(mu, SIG, p.interval = 0.95)




