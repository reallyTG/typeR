library(rmutil)


### Name: int
### Title: Vectorized Numerical Integration
### Aliases: int
### Keywords: math

### ** Examples

f <- function(x) sin(x)+cos(x)-x^2
int(f, a=0, b=2)
int(f, a=0, b=2, type="TOMS614")
#
f <- function(x) exp(-(x-2)^2/2)/sqrt(2*pi)
int(f, a=0:3)
int(f, a=0:3, d=2)
1-pnorm(0:3, 2)



