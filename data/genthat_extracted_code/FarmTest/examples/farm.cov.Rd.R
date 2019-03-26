library(FarmTest)


### Name: farm.cov
### Title: Covariance estimation with Huber's loss function
### Aliases: farm.cov

### ** Examples

set.seed(100)
p = 20
n = 10
X = matrix(rnorm( p*n, 0,1), nrow = n)
covhat = farm.cov(X)




