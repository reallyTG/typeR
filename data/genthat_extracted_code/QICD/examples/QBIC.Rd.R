library(QICD)


### Name: QBIC
### Title: High dimensional BIC for quantile regression model
### Aliases: QBIC
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
res=QICD(y,x,beta1,tau,lambda=10,a,"scad",intercept=intercept)
QBIC(y,cbind(x,rep(1,n)),res$beta_final,tau=tau)



