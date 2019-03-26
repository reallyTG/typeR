library(matlib)


### Name: Solve
### Title: Solve and Display Solutions for Systems of Linear Simultaneous
###   Equations
### Aliases: Solve

### ** Examples

  A1 <- matrix(c(2, 1, -1,
               -3, -1, 2,
               -2,  1, 2), 3, 3, byrow=TRUE)
  b1 <- c(8, -11, -3)
  Solve(A1, b1) # unique solution

  A2 <- matrix(1:9, 3, 3)
  b2 <- 1:3
  Solve(A2,  b2, fractions=TRUE) # underdetermined

  b3 <- c(1, 2, 4)
  Solve(A2, b3, fractions=TRUE) # overdetermined



