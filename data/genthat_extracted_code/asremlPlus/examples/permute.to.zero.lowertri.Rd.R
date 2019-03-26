library(asremlPlus)


### Name: permute.to.zero.lowertri
### Title: Permutes a square matrix until all the lower triangular elements
###   are zero.
### Aliases: permute.to.zero.lowertri
### Keywords: array

### ** Examples

  terms.marginality <-  matrix(c(1,0,0,0,0,  0,1,0,0,0, 0,1,1,0,0, 
                                 1,1,1,1,0, 1,1,1,1,1), nrow=5)
  terms.marginality <- permute.to.zero.lowertri(terms.marginality)



