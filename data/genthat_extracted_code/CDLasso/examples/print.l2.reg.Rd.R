library(CDLasso)


### Name: print.l2.reg
### Title: Print results of Cyclic Coordinate Descent for L2 Regression
### Aliases: print.l2.reg

### ** Examples

set.seed(100)
n=500
p=2000
nzfixed = c(1:5)
true.beta<-rep(0,p)
true.beta[nzfixed] = c(1,1,1,1,1)

x=matrix(rnorm(n*p),p,n)
y = t(x) %*% true.beta

rownames(x)<-1:nrow(x)
colnames(x)<-1:ncol(x)

#Lasso penalized L2 regression
out<-l2.reg(x,y,lambda=2)

#Re-estimate parameters without penalization
out2<-l2.reg(x[out$selected,],y,lambda=0)
print(out2)



