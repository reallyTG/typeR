library(ggm)


### Name: triDec
### Title: Triangular decomposition of a covariance matrix
### Aliases: triDec
### Keywords: array algebra models multivariate

### ** Examples

## Triangular decomposition of a covariance matrix
B <- matrix(c(1,  -2, 0, 1,
              0,   1, 0, 1,
              0,   0, 1, 0,
              0,   0, 0, 1), 4, 4, byrow=TRUE)
B
D <- diag(c(3, 1, 2, 1))
S <- B %*% D %*% t(B)
triDec(S)
solve(B)



