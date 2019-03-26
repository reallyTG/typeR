library(matlib)


### Name: Ginv
### Title: Generalized Inverse of a Matrix
### Aliases: Ginv

### ** Examples

A <- matrix(c(1,2,3,4,5,6,7,8,10), 3, 3) # a nonsingular matrix
A
Ginv(A, fractions=TRUE)  # a generalized inverse of A = inverse of A
round(Ginv(A) %*% A, 6)  # check

B <- matrix(1:9, 3, 3) # a singular matrix
B
Ginv(B, fractions=TRUE)  # a generalized inverse of B
B %*% Ginv(B) %*% B   # check




