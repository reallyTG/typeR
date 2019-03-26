library(matlib)


### Name: Det
### Title: Determinant of a Square Matrix
### Aliases: Det

### ** Examples

A <- matrix(c(1,2,3,2,5,6,3,6,10), 3, 3) # nonsingular, symmetric
A
Det(A)
Det(A, verbose=TRUE, fractions=TRUE)
B <- matrix(1:9, 3, 3) # a singular matrix
B
Det(B)
C <- matrix(c(1, .5, .5, 1), 2, 2) # square, symmetric, nonsingular
Det(C)
Det(C, method="eigenvalues")
Det(C, method="cofactors")



