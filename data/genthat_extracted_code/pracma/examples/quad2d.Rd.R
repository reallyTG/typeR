library(pracma)


### Name: quad2d
### Title: 2-d Gaussian Quadrature
### Aliases: quad2d
### Keywords: math

### ** Examples

##  Example:  f(x, y) = (y+1)*exp(x)*sin(16*y-4*(x+1)^2)
f <- function(x, y)
        (y+1) * exp(x) * sin(16*y-4*(x+1)^2)
# this is even faster than cubature::adaptIntegral():
quad2d(f, -1, 1, -1, 1)
# 0.0179515583236958  # true value 0.01795155832370

##  Volume of the sphere: use polar coordinates
f0 <- function(x, y) sqrt(1 - x^2 - y^2)  # for x^2 + y^2 <= 1
fp <- function(x, y) y * f0(y*cos(x), y*sin(x))
quad2d(fp, 0, 2*pi, 0, 1, n = 101)  # 2.09439597740074
2/3 * pi                            # 2.0943951023932



