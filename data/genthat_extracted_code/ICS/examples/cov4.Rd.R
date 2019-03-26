library(ICS)


### Name: cov4
### Title: Scatter Matrix based on Fourth Moments
### Aliases: cov4
### Keywords: multivariate

### ** Examples

set.seed(654321)
cov.matrix <- matrix(c(3,2,1,2,4,-0.5,1,-0.5,2), ncol=3)
X <- rmvnorm(100, c(0,0,0), cov.matrix)
cov4(X)
cov4(X, location="Origin")
rm(.Random.seed)



