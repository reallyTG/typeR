library(CDLasso)


### Name: summary.logit.reg
### Title: Print all results of Cyclic Coordinate Descent for Logistic
###   Regression
### Aliases: summary.logit.reg

### ** Examples

set.seed(1001)
n=500;p=5000
beta=c(1,1,1,1,1,rep(0,p-5))
x=matrix(rnorm(n*p),p,n)
xb = t(x) %*% beta
logity=exp(xb)/(1+exp(xb))
y=rbinom(n=length(logity),prob=logity,size=1)

rownames(x)<-1:nrow(x)
colnames(x)<-1:ncol(x)

#Lasso penalized logistic regression
out<-logit.reg(x,y,lambda=50)

#Re-estimate parameters without penalization
out2<-logit.reg(x[out$selected,],y,lambda=0)
summary(out2)



