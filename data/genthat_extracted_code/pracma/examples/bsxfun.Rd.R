library(pracma)


### Name: bsxfun
### Title: Elementwise Function Application (Matlab Style)
### Aliases: bsxfun arrayfun
### Keywords: math

### ** Examples

X <- matrix(rep(1:10, each = 10), 10, 10)
Y <- t(X)
bsxfun("*", X, Y)  # multiplication table

f <- function(x, y) x[1] * y[1]     # function not vectorized
A <- matrix(c(2, 3, 5, 7), 2, 2)
B <- matrix(c(11, 13, 17, 19), 2, 2)
arrayfun(f, A, B)



