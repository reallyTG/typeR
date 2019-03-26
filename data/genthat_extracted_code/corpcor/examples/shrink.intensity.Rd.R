library(corpcor)


### Name: shrink.intensity
### Title: Estimation of Shrinkage Intensities
### Aliases: estimate.lambda estimate.lambda.var
### Keywords: multivariate

### ** Examples

# load corpcor library
library("corpcor")

# small n, large p
p = 100
n = 20

# generate random pxp covariance matrix
sigma = matrix(rnorm(p*p),ncol=p)
sigma = crossprod(sigma)+ diag(rep(0.1, p))

# simulate multinormal data of sample size n  
sigsvd = svd(sigma)
Y = t(sigsvd$v %*% (t(sigsvd$u) * sqrt(sigsvd$d)))
X = matrix(rnorm(n * ncol(sigma)), nrow = n) %*% Y


# correlation shrinkage intensity
estimate.lambda(X) 
c = cor.shrink(X)
attr(c, "lambda")

# variance shrinkage intensity
estimate.lambda.var(X) 
v = var.shrink(X)
attr(v, "lambda.var")




