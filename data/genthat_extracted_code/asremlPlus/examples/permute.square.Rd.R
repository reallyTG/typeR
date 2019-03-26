library(asremlPlus)


### Name: permute.square
### Title: Permutes the rows and columns of a square matrix.
### Aliases: permute.square
### Keywords: array

### ** Examples

  terms.marginality <-  matrix(c(1,0,0,0,0,  0,1,0,0,0, 0,1,1,0,0, 
                                 1,1,1,1,0, 1,1,1,1,1), nrow=5)
  permtn <- c(1,3,2,4,5)
  terms.marginality <- permute.square(terms.marginality, permtn)



