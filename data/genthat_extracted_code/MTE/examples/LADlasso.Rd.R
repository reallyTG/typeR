library(MTE)


### Name: LADlasso
### Title: LAD-Lasso for Linear Regression
### Aliases: LADlasso

### ** Examples

set.seed(2017)
n=200; d=50
X=matrix(rnorm(n*d), nrow=n, ncol=d)
beta=c(rep(2,6), rep(0, 44))
y=X%*%beta+c(rnorm(150), rnorm(30,10,10), rnorm(20,0,100))
output.LADLasso=LADlasso(y,X, beta.ini=LAD(y, X), lambda=0.2, adaptive=TRUE)
beta.est=output.LADLasso$beta




