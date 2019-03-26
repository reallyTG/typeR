library(hdi)


### Name: clusterGroupBound
### Title: Hierarchical structure group tests in linear model
### Aliases: clusterGroupBound
### Keywords: confidence intervals regression hierarchical clustering

### ** Examples

## Create a regression problem with correlated design (n = 10, p = 3):
## a block of size 2 and a block of size 1, within-block correlation is 0.99

set.seed(29)
p   <- 3
n   <- 10

Sigma <- diag(p)
Sigma[1,2] <- Sigma[2,1] <- 0.99

x <- matrix(rnorm(n * p), nrow = n) %*% chol(Sigma)

## Create response with active variable 1
beta    <- rep(0, p)
beta[1] <- 5

y  <- as.numeric(x %*% beta + rnorm(n))
## No test: 
out <- clusterGroupBound(x, y, nsplit = 4) ## use larger value for nsplit!

## Plot and print the hierarchical group-test
plot(out)
print(out)
out$members
out$lowerBound
## End(No test)



