library(flare)


### Name: predict.slim
### Title: Prediction for an object with S3 class '"slim"'
### Aliases: predict.slim

### ** Examples

## load library
library(flare)
## generate data
set.seed(123)
n = 100
d = 200
d1 = 10
rho0 = 0.3
lambda = c(3:1)*sqrt(log(d)/n)
Sigma = matrix(0,nrow=d,ncol=d)
Sigma[1:d1,1:d1] = rho0
diag(Sigma) = 1
mu = rep(0,d)
X = mvrnorm(n=2*n,mu=mu,Sigma=Sigma)
X.fit = X[1:n,]
X.pred = X[(n+1):(2*n),]
eps = rt(n=n,df=n-1)
beta = c(rep(sqrt(1/3),3),rep(0,d-3))
Y.fit = X.fit%*%beta+eps

## Regression with "dantzig".
out=slim(X=X.fit,Y=Y.fit,lambda=lambda,method = "lq",q=1)

## Display results
Y=predict(out,X.pred)



