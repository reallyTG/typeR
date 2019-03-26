library(spam)


### Name: det
### Title: Calculate the determinant of a positive definite Sparse Matrix
### Aliases: det,spam-method det,spam.chol.NgPeyton-method det.spam det
###   determinant determinant,spam-method determinant.spam
###   determinant.spam.chol determinant.spam.chol.NgPeyton
### Keywords: array algebra

### ** Examples

x <- spam( c(4,3,0,3,5,1,0,1,4),3)
det( x)
determinant( x)

det( chol( x))



