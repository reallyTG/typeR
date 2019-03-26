library(MPkn)


### Name: MPKlMatrix
### Title: Creates a matrix of specified row of output 'MUPkLo'
### Aliases: MPKlMatrix
### Keywords: MPKlMatrix

### ** Examples

A <- array(c(0.9, 0.6, 0.8, 0.05, 0.2, 0.05, 0.05, 0.2, 0.15), c(3, 3))
P <- array(c(0.9, 0.6, 0.8, 0.05, 0.2, 0.05, 0.05, 0.2, 0.15), c(3, 3))
U <- array(c(0.8, 0.8, 0.7, 0.06, 0.02, 0.2, 0.14, 0.18, 0.1), c(3, 3))
sta <- c(1, 2, 3)
k <- c(1, 0, 1, 0)
n <- c(5, 7, 12, 17)
Mx <- MUPkLo(A, P, U, n, k, sta)
M100 = MPKlMatrix(Mx, step = 100, nc = 3, sta = c(1, 2, 3))



