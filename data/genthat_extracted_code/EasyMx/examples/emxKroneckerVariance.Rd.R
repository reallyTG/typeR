library(EasyMx)


### Name: emxKroneckerVariance
### Title: Creates a large Variance matrix by Kroneckering two smaller
###   matrices
### Aliases: emxKroneckerVariance

### ** Examples

   
# Create a loadings matrix
require(EasyMx)
x <- letters[23:26]
amat <- emxCholeskyVariance(x, 'A')
ahmat <- emxRelatednessMatrix(2, c(1, .5, 1), name='AH')
ab <- emxKroneckerVariance(ahmat, amat[[2]], 'AB')




