library(pracma)


### Name: hessian
### Title: Hessian Matrix
### Aliases: hessian
### Keywords: math

### ** Examples

f <- function(x) cos(x[1] + x[2])
x0 <- c(0, 0)
hessian(f, x0)

f <- function(u) {
    x <- u[1]; y <- u[2]; z <- u[3]
    return(x^3 + y^2 + z^2 +12*x*y + 2*z)
}
x0 <- c(1,1,1)
hessian(f, x0)



