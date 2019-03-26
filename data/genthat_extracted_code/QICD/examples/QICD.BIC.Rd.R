library(QICD)


### Name: QICD.BIC
### Title: BIC for QICD on tuning parameter searching
### Aliases: QICD.BIC
### Keywords: QBIC High dimensional Quantile regression

### ** Examples

x=matrix(rnorm(1000),50)
n=dim(x)[1]
p=dim(x)[2]
intercept=1
y=x[,1]+x[,7]+x[,9]+0.1*rnorm(n)
beta1=rep(0,p+intercept)
tau=0.5
a=2.7
res.BIC=QICD.BIC(y, x, beta1,const=6, tau, 
lambda=seq(8,10,by=0.1), a,funname="scad",intercept=intercept)



