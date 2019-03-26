library(corpcor)


### Name: cov.shrink
### Title: Shrinkage Estimates of Covariance and Correlation
### Aliases: cov.shrink cor.shrink var.shrink
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


# estimate covariance matrix
s1 = cov(X)
s2 = cov.shrink(X)


# squared error
sum((s1-sigma)^2)
sum((s2-sigma)^2)


# compare positive definiteness
is.positive.definite(sigma)
is.positive.definite(s1)
is.positive.definite(s2)


# compare ranks and condition
rank.condition(sigma)
rank.condition(s1)
rank.condition(s2)

# compare eigenvalues
e0 = eigen(sigma, symmetric=TRUE)$values
e1 = eigen(s1, symmetric=TRUE)$values
e2 = eigen(s2, symmetric=TRUE)$values
m = max(e0, e1, e2)
yl = c(0, m)

par(mfrow=c(1,3))
plot(e1,  main="empirical")
plot(e2,  ylim=yl, main="full shrinkage")
plot(e0,  ylim=yl, main="true")
par(mfrow=c(1,1))




