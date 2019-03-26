library(EasyMx)


### Name: emxCholeskyVariance
### Title: Create a variance matrix in Cholesky form
### Aliases: emxCholeskyVariance

### ** Examples

   
# Create a Cholesky variance matrix called 'A'
require(EasyMx)
nVar <- 3
x <- paste0('x', 1:nVar)
amat <- emxCholeskyVariance(x, 'A')




