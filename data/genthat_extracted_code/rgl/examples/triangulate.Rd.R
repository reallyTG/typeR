library(rgl)


### Name: triangulate
### Title: Triangulate a two-dimensional polygon.
### Aliases: triangulate
### Keywords: graphics

### ** Examples

theta <- seq(0, 2*pi, len = 25)[-25]
theta <- c(theta, NA, theta, NA, theta, NA, theta, NA, theta)
r <- c(rep(1.5, 24), NA, rep(0.5, 24), NA, rep(0.5, 24), NA, rep(0.3, 24), NA, rep(0.1, 24))
dx <- c(rep(0, 24), NA, rep(0.6, 24), NA, rep(-0.6, 24), NA, rep(-0.6, 24), NA, rep(-0.6, 24))
x <- r*cos(theta) + dx
y <- r*sin(theta)
plot(x, y, type = "n")
polygon(x, y)
triangulate(x, y, plot = TRUE)
open3d()
polygon3d(x, y, x - y, col = "red")



