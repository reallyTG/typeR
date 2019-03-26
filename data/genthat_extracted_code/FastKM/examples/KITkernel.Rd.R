library(FastKM)


### Name: KITkernel
### Title: A Fast Multiple-Kernel Method Based on a Low-Rank Approximation
###   with Kernel Inputs.
### Aliases: KITkernel

### ** Examples

if( requireNamespace("SKAT", quietly=TRUE) ) {

  matA <- matrix(data = rnorm(100*20), nrow = 100, ncol = 20)
  matB <- matrix(data = rnorm(100), nrow = 100, ncol = 1)
  y <- rnorm(100)

  kmatA <- (1 + tcrossprod(matA,matA))^2
  kmatB <- tcrossprod(matB,matB)

  KITkernel(y = y, kmatA = kmatA, kmatB = kmatB, AkernelC = 1.0)

}





