library(MTE)


### Name: LAD
### Title: Least Absolute Deviance Estimator for Linear Regression
### Aliases: LAD

### ** Examples

set.seed(1989)
n=200; d=4
X=matrix(rnorm(n*d), nrow=n, ncol=d)
beta=c(1, -1, 2, -2)
y=-2+X%*%beta+c(rnorm(150), rnorm(30,10,10), rnorm(20,0,100))
beta.ls=lm(y~X)$coeff
beta.MTE=LAD(y,X,intercept=TRUE)
cbind(c(-2,beta), beta.ls, beta.MTE)




