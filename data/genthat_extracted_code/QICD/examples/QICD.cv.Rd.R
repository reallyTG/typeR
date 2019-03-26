library(QICD)


### Name: QICD.cv
### Title: Cross-validation for QICD
### Aliases: QICD.cv
### Keywords: Cross Validation Tuning parameter

### ** Examples

x=matrix(rnorm(1000),50)
n=dim(x)[1]
p=dim(x)[2]
intercept=1
y=x[,1]+x[,7]+x[,9]+0.1*rnorm(n)
beta1=rep(0,p+intercept)
tau=0.5
a=2.7
res.cv=QICD.cv(y, x, beta1, tau, lambda=seq(8,9,by=0.1),
nfolds=3, a, funname="scad",intercept=intercept)



