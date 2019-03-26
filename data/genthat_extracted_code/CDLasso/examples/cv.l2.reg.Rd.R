library(CDLasso)


### Name: cv.l2.reg
### Title: k-fold Cross Validation
### Aliases: cv.l2.reg cv.l2.reg.default

### ** Examples

set.seed(100)
n=50 
p=200
nzfixed = c(1:5)
true.beta<-rep(0,p)
true.beta[nzfixed] = c(1,1,1,1,1)

x=matrix(rnorm(n*p),p,n)
y = t(x) %*% true.beta

rownames(x)<-1:nrow(x)
colnames(x)<-1:ncol(x)

crossval2<-cv.l2.reg(x,y,10,exp((1:15))/1000)
plot(crossval2)
out2<-l2.reg(x,y,crossval2$lam.opt)



