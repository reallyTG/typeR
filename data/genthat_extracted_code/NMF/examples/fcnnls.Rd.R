library(NMF)


### Name: fcnnls
### Title: Fast Combinatorial Nonnegative Least-Square
### Aliases: fcnnls fcnnls,ANY,numeric-method fcnnls,matrix,matrix-method
###   fcnnls-methods fcnnls,numeric,matrix-method
### Keywords: methods multivariate optimize regression

### ** Examples

## Don't show: 
# roxygen generated flag
options(R_CHECK_RUNNING_EXAMPLES_=TRUE)
## End(Don't show)

## Define a random nonnegative matrix matrix
n <- 200; p <- 20; r <- 3
V <- rmatrix(n, p)

## Compute the optimal matrix K for a given X matrix
X <- rmatrix(n, r)
res <- fcnnls(X, V)

## Compute the same thing using the Moore-Penrose generalized pseudoinverse
res <- fcnnls(X, V, pseudo=TRUE)

## It also works in the case of single vectors
y <- runif(n)
res <- fcnnls(X, y)
# or
res <- fcnnls(X[,1], y)



