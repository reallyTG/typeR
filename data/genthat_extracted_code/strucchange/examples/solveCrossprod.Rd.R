library(strucchange)


### Name: solveCrossprod
### Title: Inversion of X'X
### Aliases: solveCrossprod
### Keywords: algebra

### ** Examples

X <- cbind(1, rnorm(100))
solveCrossprod(X)
solve(crossprod(X))



