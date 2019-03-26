library(expm)


### Name: matpow
### Title: Matrix Power
### Aliases: %^% matpow
### Keywords: array arith

### ** Examples

A <- cbind(1, 2 * diag(3)[,-1])
A
A %^% 2
stopifnot(identical(A, A %^% 1),
          A %^% 2 == A %*% A)



