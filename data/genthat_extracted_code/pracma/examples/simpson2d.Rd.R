library(pracma)


### Name: simpson2d
### Title: Double Simpson Integration
### Aliases: simpson2d
### Keywords: math

### ** Examples

f1 <- function(x, y) x^2 + y^2
simpson2d(f1, -1, 1, -1, 1)     #   2.666666667 , i.e. 8/3 . err = 0

f2 <- function(x, y) y*sin(x)+x*cos(y)
simpson2d(f2, pi, 2*pi, 0, pi)  #  -9.869604401 , i.e. -pi^2, err = 2e-8

f3 <- function(x, y) sqrt((1 - (x^2 + y^2)) * (x^2 + y^2 <= 1))
simpson2d(f3, -1, 1, -1, 1)     #   2.094393912 , i.e. 2/3*pi , err = 1e-6



