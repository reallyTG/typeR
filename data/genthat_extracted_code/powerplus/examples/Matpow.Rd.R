library(powerplus)


### Name: Matpow
### Title: Matrix Power
### Aliases: Matpow

### ** Examples

A <- matrix(1:4, ncol = 2)

Matpow(A, 3)
Matpow(A, 0.5)
Matpow(A, 0.2)
Matpow(A, 1, 5)
Matpow(A, 2, 4, expmethod = "Pade", logmethod = "Eigen") #inocuous, as A is diagonalizable
Matpow(A, -1)
Matpow(A, 2+5i)
Matpow(A, 3i)
Matpow(A, 1+2i)
Matpow(A, 3i, 2+7i)

B <- matrix(sample(1:100, 81), ncol = 9)
Matpow(B, 2)
Matpow(B, 0.5)
Matpow(B, 7+2i)
Matpow(B, 4i, 1+3i)

C <- matrix(c(1, 0, 1, 1), ncol = 2) # A non-diagonalizable matrix
Matpow(C, 3)
Matpow(C, 0.5)
Matpow(C, 4, 8, expmethod = "Taylor", logmethod = "Eigen")
Matpow(C, 0.5*pi)
Matpow(C, 0.24)
Matpow(C, -2)
Matpow(C, 3+5i)
Matpow(C, 2i, 1+9i)




