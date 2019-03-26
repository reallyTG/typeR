library(CDLasso)


### Name: print.logit.reg
### Title: Print results of Cyclic Coordinate Descent for Logistic
###   Regression
### Aliases: print.logit.reg

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

#Lasso penalized logistic regression using optimal lambda
out<-logit.reg(x,y,50)
print(out)

#Re-estimate parameters without penalization
out2<-logit.reg(x[out$selected,],y,0)
print(out2)



