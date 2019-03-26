library(OjaNP)


### Name: ojaSignedRank
### Title: Oja Signed Ranks - Affine Equivariant Multivariate Signed Ranks
### Aliases: ojaSignedRank
### Keywords: multivariate nonparametric

### ** Examples

set.seed(123)
X <- rmvnorm(n = 30,mean = c(0,0)) # from package 'mvtnorm'
ojaSignedRank(X)
ojaSignedRank(X, x = c(0,0)) # zero



