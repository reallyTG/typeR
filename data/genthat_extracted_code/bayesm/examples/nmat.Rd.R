library(bayesm)


### Name: nmat
### Title: Convert Covariance Matrix to a Correlation Matrix
### Aliases: nmat
### Keywords: utilities array

### ** Examples

set.seed(66)
X = matrix(rnorm(200,4), ncol=2)
Varmat = var(X)
nmat(as.vector(Varmat))



