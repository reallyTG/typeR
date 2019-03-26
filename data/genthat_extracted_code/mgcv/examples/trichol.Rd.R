library(mgcv)


### Name: trichol
### Title: Choleski decomposition of a tri-diagonal matrix
### Aliases: trichol
### Keywords: models smooth regression

### ** Examples

require(mgcv)
## simulate some diagonals...
set.seed(19); k <- 7
ld <- runif(k)+1
sd <- runif(k-1) -.5

## get diagonals of chol factor...
trichol(ld,sd)

## compare to dense matrix result...
A <- diag(ld);for (i in 1:(k-1)) A[i,i+1] <- A[i+1,i] <- sd[i]
R <- chol(A)
diag(R);diag(R[,-1])




