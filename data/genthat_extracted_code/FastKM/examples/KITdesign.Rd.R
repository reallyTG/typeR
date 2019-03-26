library(FastKM)


### Name: KITdesign
### Title: A Fast Multiple-Kernel Method Based on a Low-Rank Approximation
###   with Design Matrix Inputs
### Aliases: KITdesign

### ** Examples


if( requireNamespace("SKAT", quietly=TRUE) ) {

  matA <- matrix(data = rnorm(100*20), nrow = 100, ncol = 20)
  matB <- matrix(data = rnorm(100), nrow = 100, ncol = 1)

  y <- rnorm(100)

  KITdesign(y = y, 
            matA = nongeno(matA, kernel = "linear"), 
            matB = nongeno(matB, kernel = "linear"))

}



