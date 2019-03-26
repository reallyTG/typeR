library(pracma)


### Name: dblquad
### Title: Double and Triple Integration
### Aliases: dblquad triplequad
### Keywords: math

### ** Examples

f1 <- function(x, y) x^2 + y^2
dblquad(f1, -1, 1, -1, 1)       #   2.666666667 , i.e. 8/3 . err = 0

f2 <- function(x, y) y*sin(x)+x*cos(y)
dblquad(f2, pi, 2*pi, 0, pi)    #  -9.869604401 , i.e. -pi^2, err = 0

# f3 <- function(x, y) sqrt((1 - (x^2 + y^2)) * (x^2 + y^2 <= 1))
f3 <- function(x, y) sqrt(pmax(0, 1 - (x^2 + y^2)))
dblquad(f3, -1, 1, -1, 1)       #   2.094395124 , i.e. 2/3*pi , err = 2e-8

f4 <- function(x, y, z) y*sin(x)+z*cos(x)
triplequad(f4, 0,pi, 0,1, -1,1) # - 2.0 => -2.220446e-16



