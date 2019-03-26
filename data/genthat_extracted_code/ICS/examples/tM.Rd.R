library(ICS)


### Name: tM
### Title: Joint M-estimation of Location and Scatter for a Multivariate
###   t-distribution
### Aliases: tM
### Keywords: multivariate

### ** Examples

set.seed(654321)
cov.matrix <- matrix(c(3,2,1,2,4,-0.5,1,-0.5,2), ncol=3)
X <- rmvt(100, cov.matrix, 1)
tM(X)
rm(.Random.seed)



