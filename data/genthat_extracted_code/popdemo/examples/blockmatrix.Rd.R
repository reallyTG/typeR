library(popdemo)


### Name: blockmatrix
### Title: Block-permute a reducible matrix
### Aliases: blockmatrix

### ** Examples

  # Create a 3x3 reducible PPM
  A <- matrix(c(0,1,0,0.5,0.1,0,0,0.6,0.6), byrow=TRUE, ncol=3)
  dimnames(A) <- list(c("Juv", "Pre-R", "R"), c("Juv", "Pre-R", "R"))
  A

  # Block-permute the matrix
  blockmatrix(A)




