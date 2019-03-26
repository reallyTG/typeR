library(FastBandChol)


### Name: banded.chol.cv
### Title: Selects bandwidth for Cholesky factorization by cross validation
### Aliases: banded.chol.cv

### ** Examples

## set sample size and dimension
n=20
p=100

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

## perform cross validation
k = 4:7
out1.cv = banded.chol.cv(X, bandwidth=k, folds = 5)




