library(ICSNP)


### Name: spatial.median
### Title: Spatial Median
### Aliases: spatial.median
### Keywords: multivariate nonparametric

### ** Examples

set.seed(654321)
cov.matrix <- matrix(c(3,2,1,2,4,-0.5,1,-0.5,2), ncol=3)
X <- rmvnorm(100, c(0,0,0), cov.matrix)
spatial.median(X)
rm(.Random.seed)
         


