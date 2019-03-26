library(FastBandChol)


### Name: FastBandChol-package
### Title: Fast estimation of covariance matrix by banded Cholesky factor
### Aliases: FastBandChol-package FastBandChol

### ** Examples

## set sample size and dimension
n = 20
p = 100

## create covariance with AR1 structure
Sigma = matrix(0, nrow=p, ncol=p)
for(l in 1:p){
  for(m in 1:p){
    Sigma[l,m] = .5^(abs(l-m))
  }
}

## simulation Normal data
eo1 = eigen(Sigma)
Sigma.sqrt = eo1$vec%*%diag(eo1$val^.5)%*%t(eo1$vec)
X = t(Sigma.sqrt%*%matrix(rnorm(n*p), nrow=p, ncol=n))

## compute estimates
est.sample = banded.sample(X, bandwidth=4)$est
est.chol = banded.chol(X, bandwidth=4)$est





