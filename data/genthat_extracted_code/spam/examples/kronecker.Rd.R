library(spam)


### Name: kronecker
### Title: Kronecker Products on Sparse Matrices
### Aliases: kronecker.default kronecker.spam kronecker,spam,ANY-method
###   kronecker,ANY,spam-method kronecker,spam,spam-method
### Keywords: array algebra

### ** Examples

# Starting with non-spam objects, we get a spam matrix
kronecker.spam( diag(2), array(1:4, c(2, 2)))

kronecker( diag.spam(2), array(1:4, c(2, 2)))

# Notice the preservation of sparsity structure: 
kronecker( diag.spam(2), array(1:4, c(2, 2)), FUN="+")





