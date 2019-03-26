library(ICSNP)


### Name: HP1.shape
### Title: One Step Rank Scatter Estimator
### Aliases: HP1.shape
### Keywords: multivariate nonparametric

### ** Examples

set.seed(654321)
cov.matrix <- matrix(c(3,2,1,2,4,-0.5,1,-0.5,2), ncol=3)
X <- rmvnorm(100, c(0,0,0), cov.matrix)
HP1.shape(X)
HP1.shape(X, location="Origin")
cov.matrix/det(cov.matrix)^(1/3)
rm(.Random.seed)
         


