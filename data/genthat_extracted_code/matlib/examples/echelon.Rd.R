library(matlib)


### Name: echelon
### Title: Echelon Form of a Matrix
### Aliases: echelon

### ** Examples

A <- matrix(c(2, 1, -1,
             -3, -1, 2,
             -2,  1, 2), 3, 3, byrow=TRUE)
b <- c(8, -11, -3)
echelon(A, b, verbose=TRUE, fractions=TRUE) # reduced row-echelon form
echelon(A, b, reduced=FALSE, verbose=TRUE, fractions=TRUE) # row-echelon form

A <- matrix(c(1,2,3,4,5,6,7,8,10), 3, 3) # a nonsingular matrix
A
echelon(A, reduced=FALSE) # the row-echelon form of A
echelon(A) # the reduced row-echelon form of A

b <- 1:3
echelon(A, b)  # solving the matrix equation Ax = b
echelon(A, diag(3)) # inverting A

B <- matrix(1:9, 3, 3) # a singular matrix
B
echelon(B)
echelon(B, reduced=FALSE)
echelon(B, b)
echelon(B, diag(3))




