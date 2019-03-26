library(matlib)


### Name: gaussianElimination
### Title: Gaussian Elimination
### Aliases: gaussianElimination print.enhancedMatrix

### ** Examples

  A <- matrix(c(2, 1, -1,
               -3, -1, 2,
               -2,  1, 2), 3, 3, byrow=TRUE)
  b <- c(8, -11, -3)
  gaussianElimination(A, b)
  gaussianElimination(A, b, verbose=TRUE, fractions=TRUE)
  gaussianElimination(A, b, verbose=TRUE, fractions=TRUE, latex=TRUE)

  # determine whether matrix is solvable
  gaussianElimination(A, numeric(3))

  # find inverse matrix by elimination: A = I -> A^-1 A = A^-1 I -> I = A^-1
  gaussianElimination(A, diag(3))
  inv(A)




