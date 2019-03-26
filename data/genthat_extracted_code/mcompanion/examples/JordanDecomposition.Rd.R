library(mcompanion)


### Name: JordanDecomposition
### Title: Create objects representing Jordan decompositions
### Aliases: JordanDecomposition JordanDecomposition-methods
###   JordanDecomposition,ANY,ANY-method
###   JordanDecomposition,JordanDecomposition,missing-method
###   JordanDecomposition,list,missing-method
###   JordanDecomposition,missing,matrix-method
###   JordanDecomposition,missing,missing-method
###   JordanDecomposition,number,matrix-method
###   JordanDecomposition,number,missing-method
###   JordanDecomposition,SmallMultiCompanion,missing-method
### Keywords: methods jordan

### ** Examples

m <- matrix(c(1,2,4,3), nrow = 2)

JordanDecomposition(values = rep(0,2), vectors = m)
JordanDecomposition(values = c(0.3, 0.9), vectors = m)

## eigenvalues are set to  NA's here:
JordanDecomposition(vectors = m)

## eigenvectors are set to vectors of NA's here:
JordanDecomposition(values = rep(0,2), height = c(1,1))



