library(ICSNP)


### Name: duembgen.shape
### Title: Duembgen's Shape Matrix
### Aliases: duembgen.shape
### Keywords: multivariate robust

### ** Examples

set.seed(654321)
cov.matrix <- matrix(c(3,2,1,2,4,-0.5,1,-0.5,2), ncol=3)
X <- rmvnorm(100, c(0,0,0), cov.matrix)
cov.matrix/det(cov.matrix)^(1/3)
duembgen.shape(X)
rm(.Random.seed)



