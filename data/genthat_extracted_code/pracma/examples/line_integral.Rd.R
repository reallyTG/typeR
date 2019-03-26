library(pracma)


### Name: line_integral
### Title: Line integral (in the complex plane)
### Aliases: line_integral
### Keywords: math

### ** Examples

##  Complex integration examples
points <- c(0, 1+1i, 1-1i, 0)           # direction mathematically negative
f <- function(z) 1 / (2*z -1)
I <- line_integral(f, points)
abs(I - (0-pi*1i))                      # 0 ; residuum 2 pi 1i * 1/2

f <- function(z) 1/z
points <- c(-1i, 1, 1i, -1, -1i)
I <- line_integral(f, points)           # along a rectangle around 0+0i
abs(I - 2*pi*1i)                        #=> 0 ; residuum: 2 pi i * 1

N <- 100
x <- linspace(0, 2*pi, N)
y <- cos(x) + sin(x)*1i
J <- line_integral(f, waypoints = y)    # along a circle around 0+0i
abs(I - J)                              #=> 5.015201e-17; same residuum



