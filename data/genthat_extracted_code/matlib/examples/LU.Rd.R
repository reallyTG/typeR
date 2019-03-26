library(matlib)


### Name: LU
### Title: LU Decomposition
### Aliases: LU

### ** Examples


  A <- matrix(c(2, 1, -1,
               -3, -1, 2,
               -2,  1, 2), 3, 3, byrow=TRUE)
  b <- c(8, -11, -3)
  (ret <- LU(A)) # P is an identity; no row swapping
  with(ret, L %*% U) # check that A = L * U
  LU(A, b)
  
  LU(A, b, verbose=TRUE)
  LU(A, b, verbose=TRUE, fractions=TRUE)

  # permutations required in this example
  A <- matrix(c(1,  1, -1,
                2,  2,  4,
                1, -1,  1), 3, 3, byrow=TRUE)
  b <- c(1, 2, 9)
  (ret <- LU(A, b))
  with(ret, P %*% A)
  with(ret, L %*% U)




