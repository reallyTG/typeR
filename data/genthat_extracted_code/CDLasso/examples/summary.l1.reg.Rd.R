library(CDLasso)


### Name: summary.l1.reg
### Title: Print all results of Greedy Coordinate Descent for L1 Regression
### Aliases: summary.l1.reg

### ** Examples

set.seed(100)
n=500
p=2000
nz = c(1:5)
true.beta<-rep(0,p)
true.beta[nz] = c(1,1,1,1,1)

x=matrix(rnorm(n*p),p,n)
y = t(x) %*% true.beta

rownames(x)<-1:nrow(x)
colnames(x)<-1:ncol(x)

#Lasso penalized L1 regression
out<-l1.reg(x,y,lambda=50)

#Re-estimate parameters without penalization
out2<-l1.reg(x[out$selected,],y,lambda=0)
summary(out2)



