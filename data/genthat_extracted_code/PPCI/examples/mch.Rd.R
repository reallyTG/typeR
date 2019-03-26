library(PPCI)


### Name: mch
### Title: Maximum Clusteriability Hyperplane
### Aliases: mch
### Keywords: file

### ** Examples

## generate dataset with elongated clusters for which variance ratio in
## both dimensions is misleading for clustering
set.seed(1)
S <- matrix(c(1, .7, .7, 1), 2, 2)
X <- matrix(rnorm(2000), ncol = 2)%*%S
X[,1] <- X[,1] + rep(c(.8, -.8), each = 500)
X[,2] <- X[,2] + rep(c(-.8, .8), each = 500)

## find the optimal variance ratio hyperplane solution
sol <- mch(X)

## visualise the solution
plot(X, col = sol$cluster)



