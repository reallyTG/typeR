library(CDLasso)


### Name: CDLasso-package
### Title: Coordinate descent algorithms for L1 and L2 regression
### Aliases: CDLasso-package CDLasso

### ** Examples

set.seed(1001)
n=500
p=2000
nz = c(1:5)
true.beta<-rep(0,p)
true.beta[nz] = c(1,1,1,1,1)

x=matrix(rnorm(n*p),p,n)
y = t(x) %*% true.beta

logity=exp(y)/(1+exp(y))
ylog=rbinom(n=length(logity),prob=logity,size=1)

rownames(x)<-1:nrow(x)
colnames(x)<-1:ncol(x)

#L1
outL1<-l1.reg(x,y,lambda=50)
outL1est<-l1.reg(x[outL1$selected,],y,lambda=0)

#L2
outL2<-l2.reg(x,y,2)
outL2est<-l2.reg(x[outL2$selected,],y,lambda=0)

#Logistic
outLOGIT<-logit.reg(x,ylog,lambda=50)
outLOGITest<-logit.reg(x[outLOGIT$selected,],ylog,lambda=0)




