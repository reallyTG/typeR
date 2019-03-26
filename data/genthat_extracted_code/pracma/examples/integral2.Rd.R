library(pracma)


### Name: integral2
### Title: Numerically Evaluate Double and Triple Integrals
### Aliases: integral2 integral3
### Keywords: math

### ** Examples

fun <- function(x, y) cos(x) * cos(y)
integral2(fun, 0, 1, 0, 1, reltol = 1e-10)
# $Q:     0.708073418273571  # 0.70807341827357119350 = sin(1)^2
# $error: 8.618277e-19       # 1.110223e-16

##  Compute the volume of a sphere
f <- function(x, y) sqrt(1 -x^2 - y^2)
xmin <- 0; xmax <- 1
ymin <- 0; ymax <- function(x) sqrt(1 - x^2)
I <- integral2(f, xmin, xmax, ymin, ymax)
I$Q                             # 0.5236076 - pi/6 => 8.800354e-06

##  Compute the volume over a sector
I <- integral2(f, 0,pi/2, 0,1, sector = TRUE)
I$Q                             # 0.5236308 - pi/6 => 3.203768e-05

##  Integrate 1/( sqrt(x + y)*(1 + x + y)^2 ) over the triangle
##   0 <= x <= 1, 0 <= y <= 1 - x.  The integrand is infinite at (0,0).
f <- function(x,y) 1/( sqrt(x + y) * (1 + x + y)^2 )
ymax <- function(x) 1 - x
I <- integral2(f, 0,1, 0,ymax)
I$Q + 1/2 - pi/4                # -3.247091e-08

##  Compute this integral as a sector
rmax <- function(theta) 1/(sin(theta) + cos(theta))
I <- integral2(f, 0,pi/2, 0,rmax, sector = TRUE, singular = TRUE)
I$Q + 1/2 - pi/4                # -4.998646e-11

##  Examples of computing triple integrals
f0 <- function(x, y, z) y*sin(x) + z*cos(x)
integral3(f0, 0, pi, 0,1, -1,1) # - 2.0 => 0.0

f1 <- function(x, y, z) exp(x+y+z)
integral3(f1, 0, 1, 1, 2, 0, 0.5)
## [1] 5.206447                         # 5.20644655

f2 <- function(x, y, z) x^2 + y^2 + z
a <- 2; b <- 4
ymin <- function(x) x - 1
ymax <- function(x) x + 6
zmin <- -2
zmax <- function(x, y) 4 + y^2
integral3(f2, a, b, ymin, ymax, zmin, zmax)
## [1] 47416.75556                      # 47416.7555556

f3 <- function(x, y, z) sqrt(x^2 + y^2)
a <- -2; b <- 2
ymin <- function(x) -sqrt(4-x^2)
ymax <- function(x)  sqrt(4-x^2)
zmin <- function(x, y)  sqrt(x^2 + y^2)
zmax <- 2
integral3(f3, a, b, ymin, ymax, zmin, zmax)
## [1] 8.37758                          # 8.377579076269617



