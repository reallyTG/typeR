library(pracma)


### Name: trisolve
### Title: Tridiagonal Linear System Solver
### Aliases: trisolve
### Keywords: array

### ** Examples

set.seed(8237)
a <- rep(1, 100)
e <- runif(99); f <- rnorm(99)
x <- rep(seq(0.1, 0.9, by = 0.2), times = 20)
A <- diag(100) + Diag(e, 1) + Diag(f, -1)
rhs <- A %*% x
s <- trisolve(a, e, f, rhs)
s[1:10]                         #=> 0.1 0.3 0.5 0.7 0.9 0.1 0.3 0.5 0.7 0.9
s[91:100]                       #=> 0.1 0.3 0.5 0.7 0.9 0.1 0.3 0.5 0.7 0.9



