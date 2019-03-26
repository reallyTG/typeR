library(pracma)


### Name: gaussNewton
### Title: Gauss-Newton Function Minimization
### Aliases: gaussNewton
### Keywords: math

### ** Examples

f1 <- function(x) c(x[1]^2 + x[2]^2 - 1, x[1] + x[2] - 1)
gaussNewton(c(4, 4), f1)

f2 <- function(x) c( x[1] + 10*x[2], sqrt(5)*(x[] - x[4]),
                    (x[2] - 2*x[3])^2, 10*(x[1] - x[4])^2)
gaussNewton(c(-2, -1, 1, 2), f2)

f3 <- function(x)
        c(2*x[1] - x[2] - exp(-x[1]), -x[1] + 2*x[2] - exp(-x[2]))
gaussNewton(c(0, 0), f3)
# $xs   0.5671433 0.5671433

f4 <- function(x)  # Dennis Schnabel
        c(x[1]^2 + x[2]^2 - 2, exp(x[1] - 1) + x[2]^3 - 2)
gaussNewton(c(2.0, 0.5), f4)
# $xs    1 1

##  Examples (from Matlab)
F1 <- function(x) c(2*x[1]-x[2]-exp(-x[1]), -x[1]+2*x[2]-exp(-x[2]))
gaussNewton(c(-5, -5), F1)

# Find a matrix X such that X %*% X %*% X = [1 2; 3 4]
F2 <- function(x) {
    X <- matrix(x, 2, 2)
    D <- X %*% X %*% X - matrix(c(1,3,2,4), 2, 2)
    return(c(D))
}
sol <- gaussNewton(ones(2,2), F2)
(X  <- matrix(sol$xs, 2, 2))
#            [,1]      [,2]
# [1,] -0.1291489 0.8602157
# [2,]  1.2903236 1.1611747
X %*% X %*% X



