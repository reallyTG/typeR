library(detpack)


### Name: det.query
### Title: Density Estimation Based on Distribution Element Trees
### Aliases: det.query

### ** Examples

## 1d example
require(stats); require(graphics)
# DET generation based on Gaussian/uniform data
det <- det.construct(t(c(rnorm(1e5,2,3),runif(1e5)-3)))
# density evaluation based on DET at equidistant query points
x <- t(seq(-10,14,0.01)); p <- det.query(det, x)
# compare DET estimate (black) against Gaussian/uniform reference (red)
plot(x, p, type = "l", col = "black")
lines(x, (dnorm(x,2,3)+dunif(x+3))/2, col = "red")

## 2d example
require(stats); require(graphics)
# mean and covariance of Gaussian, data generation
mu <- c(3,5); C <- matrix(c(4.0,-2.28,-2.28,1.44), nrow = 2)
A <- eigen(C); B <- diag(A$values); A <- A$vectors
x <- matrix(rnorm(2e4), nrow = 2)
x <- t(A %*% (sqrt(B) %*% x) + mu %*% t(rep(1,ncol(x))))
# bounds and resolution of x1-x2 query grid
lb <- c(-5,0); ub <- c(11,10); np <- c(320,200)
x1 <- lb[1] + (ub[1]-lb[1])*((1:np[1])-0.5)/np[1]
x2 <- lb[2] + (ub[2]-lb[2])*((1:np[2])-0.5)/np[2]
xp <- rbind(rep(x1,np[2]), rep(x2,each = np[1])) # grid points
# plotting
split.screen(c(2, 2)); screen(1)
plot(x, type = "p", pch = ".", asp = 1, main = "data")
# DET estimator
det <- det.construct(t(x))
yd <- matrix(det.query(det, xp), nrow = np[1])
screen(2)
image(list(x = x1, y = x2, z = yd), asp = 1,
      col = grDevices::gray((100:0)/100), main = "det")
# Gaussian density for comparison
yr <- yr <- exp(-1/2 * colSums(
   (t(solve(C)) %*% (xp - mu%*%t(rep(1,ncol(xp))))) *
                    (xp - mu%*%t(rep(1,ncol(xp)))))
                              ) / sqrt((2*pi)^2*det(C))
yr <- matrix(yr, nrow = np[1])
screen(3)
image(list(x = x1, y = x2, z = yr), asp = 1,
      col = grDevices::gray((100:0)/100), main = "reference")



