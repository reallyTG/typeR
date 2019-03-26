library(ICSNP)


### Name: symm.huber
### Title: Symmetrized Huber Scatter Matrix
### Aliases: symm.huber
### Keywords: multivariate robust

### ** Examples

set.seed(654321)
cov.matrix <- matrix(c(3,2,1,2,4,-0.5,1,-0.5,2), ncol=3)
X <- rmvnorm(100, c(0,0,0), cov.matrix)
symm.huber(X)
rm(.Random.seed)



