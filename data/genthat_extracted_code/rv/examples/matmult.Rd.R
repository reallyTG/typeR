library(rv)


### Name: matmult
### Title: Random Matrix Multiplication
### Aliases: matmult %*%.rv %**%
### Keywords: arith array

### ** Examples


x <- 1:4
(z <- x %*% x)    # scalar ("inner") product (1 x 1 matrix)
drop(z)             # as scalar

y <- diag(x)
z <- matrix(1:12, ncol = 3, nrow = 4)
y %*% z
y %*% x
x %*% z



