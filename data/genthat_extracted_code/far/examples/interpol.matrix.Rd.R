library(far)


### Name: interpol.matrix
### Title: Interpolation matrix
### Aliases: interpol.matrix
### Keywords: algebra

### ** Examples

  mat1 <- interpol.matrix(12,24)
  mat2 <- interpol.matrix(c(3,5),c(12,12))
  print(mat1 %*% base.simul.far(24,5))
  print(mat2 %*% base.simul.far(24,5))  



