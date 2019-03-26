library(rmutil)


### Name: int2
### Title: Vectorized Two-dimensional Numerical Integration
### Aliases: int2
### Keywords: math

### ** Examples

f <- function(x,y) sin(x)+cos(y)-x^2
int2(f, a=c(0,1), b=c(2,4))
#
fn1 <- function(x, y) x^2+y^2
fn2 <- function(x, y) (1:4)*x^2+(2:5)*y^2
int2(fn1, c(1,2), c(2,4))
int2(fn2, c(1,2), c(2,4))
int2(fn1, matrix(c(1:4,1:4),ncol=2), matrix(c(2:5,2:5),ncol=2))
int2(fn2, matrix(c(1:4,1:4),ncol=2), matrix(c(2:5,2:5),ncol=2))



