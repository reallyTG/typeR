library(ICS)


### Name: mean3
### Title: Location Estimate based on Third Moments
### Aliases: mean3
### Keywords: multivariate

### ** Examples

set.seed(654321)
cov.matrix <- matrix(c(3,2,1,2,4,-0.5,1,-0.5,2), ncol=3)
X <- rmvnorm(100, c(0,0,0), cov.matrix)
mean3(X)
rm(.Random.seed)



