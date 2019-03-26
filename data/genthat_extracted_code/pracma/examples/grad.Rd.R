library(pracma)


### Name: grad
### Title: Numerical Gradient
### Aliases: grad
### Keywords: math

### ** Examples

f <- function(u) {
    x <- u[1]; y <- u[2]; z <- u[3]
    return(x^3 + y^2 + z^2 +12*x*y + 2*z)
 }
x0 <- c(1,1,1)
grad(f, x0)     # 15 14  4        # direction of steepest descent

sum(grad(f, x0) * c(1, -1, 0))    # 1 , directional derivative

f <- function(x) x[1]^2 + x[2]^2
grad(f, c(0,0))                   # 0 0 , i.e. a local optimum



