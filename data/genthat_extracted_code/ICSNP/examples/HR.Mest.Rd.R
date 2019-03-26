library(ICSNP)


### Name: HR.Mest
### Title: Simultaneous Affine Equivariant Estimation of Multivariate
###   Median and Tyler's Shape Matrix
### Aliases: HR.Mest
### Keywords: multivariate nonparametric

### ** Examples

set.seed(654321)
cov.matrix <- matrix(c(3,2,1,2,4,-0.5,1,-0.5,2), ncol=3)
X <- rmvnorm(100, c(0,0,0), cov.matrix)
res <- HR.Mest(X)
colMeans(X)
res$center
cov.matrix/det(cov.matrix)^(1/3)
res$scatter
rm(.Random.seed)
         


