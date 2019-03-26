library(MTE)


### Name: huber.reg
### Title: Huber estimation for linear regression
### Aliases: huber.reg

### ** Examples

set.seed(2017)
n=200; d=4
X=matrix(rnorm(n*d), nrow=n, ncol=d)
beta=c(1, -1, 2, -2)
y=-2+X%*%beta+c(rnorm(150), rnorm(30,10,10), rnorm(20,0,100))
beta0=beta.ls=lm(y~X)$coeff
beta.huber=huber.reg(y, X, beta0, 2, intercept=TRUE)$beta
cbind(c(-2,beta), beta.ls, beta.huber)



