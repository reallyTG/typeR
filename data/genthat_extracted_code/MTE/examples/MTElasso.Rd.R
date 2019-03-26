library(MTE)


### Name: MTElasso
### Title: MTE-Lasso estimator
### Aliases: MTElasso

### ** Examples

set.seed(2017)
n=200; d=50
X=matrix(rnorm(n*d), nrow=n, ncol=d)
beta=c(rep(2,6), rep(0, 44))
y=X%*%beta+c(rnorm(150), rnorm(30,10,10), rnorm(20,0,100))
beta0=MTE(y, X, rep(0,50), 0.1, 2)$beta
output.MTELasso=MTElasso(y,X, p=2, beta.ini=beta0, t=seq(0, 0.1, 0.01), method="MTE")
beta.est=output.MTELasso$beta




