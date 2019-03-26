library(GA)


### Name: persp3D
### Title: Perspective plot with colour levels
### Aliases: persp3D
### Keywords: hplot

### ** Examples

y <- x <- seq(-10, 10, length=60)
f <- function(x,y) { r <- sqrt(x^2+y^2); 10 * sin(r)/r }
z <- outer(x, y, f)
persp3D(x, y, z, theta = 30, phi = 30, expand = 0.5)
persp3D(x, y, z, color.palette = heat.colors, phi = 30, theta = 225, 
        box = TRUE, border = NA, shade = .4)
x1 <- seq(-3,3,length=50)
x2 <- seq(-3,3,length=50)
y <- function(x1, x2) sin(x1)+cos(x2)
persp3D(x1, x2, outer(x1,x2,y), zlab="y", theta = 150, phi = 20, expand = 0.6)



