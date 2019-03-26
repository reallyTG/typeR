library(CDLasso)


### Name: cv.l1.reg
### Title: k-fold Cross Validation
### Aliases: cv.l1.reg cv.l1.reg.default

### ** Examples

set.seed(6)
n=50 
p=200
nzfixed = c(1:5)
true.beta<-rep(0,p)
true.beta[nzfixed] = c(1,1,1,1,1)

x=matrix(rnorm(n*p),p,n)
y = t(x) %*% true.beta

rownames(x)<-1:nrow(x)
colnames(x)<-1:ncol(x)

crossval<-cv.l1.reg(x,y,10,(0:20)*2)
plot(crossval)
out<-l1.reg(x,y,lambda=crossval$lam.opt)
out



