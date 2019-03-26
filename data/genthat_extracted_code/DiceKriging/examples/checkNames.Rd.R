library(DiceKriging)


### Name: checkNames
### Title: Consistency test between the column names of two matrices
### Aliases: checkNames checkNamesList
### Keywords: models

### ** Examples

X1 <- matrix(1, 2, 3)
X2 <- matrix(1:6, 2, 3)

colnames(X1) <- c("x1", "x2", "x3")
checkNames(X1, X2)
# attributes the same names for X2, and returns X2

colnames(X2) <- c("x1", "x2", "x5")
## Not run: checkNames(X1, X2)
# returns an error since the names of X1 and X2 are different

colnames(X2) <- c("x2", "x1", "x3")
checkNames(X1, X2)
# returns the matrix X2, but with permuted columns

l2 <- list(x3 = 1, x2 = c(2, 3), x1 = -6)
checkNamesList(X1, l2)




