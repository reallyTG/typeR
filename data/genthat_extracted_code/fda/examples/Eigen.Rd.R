library(fda)


### Name: Eigen
### Title: Eigenanalysis preserving dimnames
### Aliases: Eigen
### Keywords: array

### ** Examples

X <- matrix(1:4, 2, dimnames=list(LETTERS[1:2], letters[3:4]))
eigen(X)
Eigen(X)
Eigen(X, valuenames='eigval')

Y <- matrix(1:4, 2, dimnames=list(letters[5:6], letters[5:6]))
Eigen(Y)

Eigen(Y, symmetric=TRUE)
# only the lower triangle is used;
# the upper triangle is ignored.  



