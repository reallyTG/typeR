library(Matrix)


### Name: isSymmetric-methods
### Title: Methods for Function isSymmetric in Package 'Matrix'
### Aliases: isSymmetric-methods isSymmetric,symmetricMatrix-method
###   isSymmetric,triangularMatrix-method isSymmetric,denseMatrix-method
###   isSymmetric,diagonalMatrix-method isSymmetric,sparseMatrix-method
### Keywords: methods

### ** Examples

isSymmetric(Diagonal(4)) # TRUE of course
M <- Matrix(c(1,2,2,1), 2,2)
isSymmetric(M) # TRUE (*and* of formal class "dsyMatrix")
isSymmetric(as(M, "dgeMatrix")) # still symmetric, even if not "formally"
isSymmetric(triu(M)) # FALSE

## Look at implementations:
showMethods("isSymmetric", includeDefs=TRUE)# "ANY": base's S3 generic; 6 more



