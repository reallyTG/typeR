library(ICSNP)


### Name: tyler.shape
### Title: Tyler's Shape Matrix
### Aliases: tyler.shape
### Keywords: multivariate robust

### ** Examples

set.seed(654321)
cov.matrix <- matrix(c(3,2,1,2,4,-0.5,1,-0.5,2), ncol=3)
X <- rmvnorm(100, c(0,0,0), cov.matrix)
tyler.shape(X)
tyler.shape(X, location=0)
cov.matrix/det(cov.matrix)^(1/3)
rm(.Random.seed)



