library(cPCG)


### Name: cPCG-package
### Title: Efficient and Customized Preconditioned Conjugate Gradient
###   Method for Solving System of Linear Equations
### Aliases: cPCG-package cPCG
### Keywords: package

### ** Examples

  # generate test data
  test_A <- matrix(c(4,1,1,3), ncol = 2)
  test_b <- matrix(1:2, ncol = 1)
  
  # conjugate gradient method solver
  cgsolve(test_A, test_b, 1e-6, 1000)
  
  # preconditioned conjugate gradient method solver, 
  # with incomplete Cholesky factorization as preconditioner
  pcgsolve(test_A, test_b, "ICC")



