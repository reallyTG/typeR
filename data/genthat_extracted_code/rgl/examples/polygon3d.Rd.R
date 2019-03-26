library(rgl)


### Name: polygon3d
### Title: Triangulate and draw a polygon in three dimensions.
### Aliases: polygon3d
### Keywords: graphics

### ** Examples

theta <- seq(0, 4*pi, len = 50)
r <- theta + 1
r <- c(r[-50], rev(theta*0.8) + 1)
theta <- c(theta[-50], rev(theta))
x <- r*cos(theta)
y <- r*sin(theta)
plot(x, y, type = "n")
polygon(x, y)
polygon3d(x, y, x + y, col = "blue")



