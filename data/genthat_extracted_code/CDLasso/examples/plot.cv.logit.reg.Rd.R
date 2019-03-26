library(CDLasso)


### Name: plot.cv.logit.reg
### Title: Cross validation plot
### Aliases: plot.cv.logit.reg

### ** Examples

set.seed(101)
n=250;p=50
beta=c(1,1,1,1,1,rep(0,p-5))
x=matrix(rnorm(n*p),p,n)
xb = t(x) %*% beta
logity=exp(xb)/(1+exp(xb))
y=rbinom(n=length(logity),prob=logity,size=1)

rownames(x)<-1:nrow(x)
colnames(x)<-1:ncol(x)
lam.vec = (0:15)*2

#K-fold cross validation
cv <- cv.logit.reg(x,y,5,lam.vec)
plot(cv)

#Lasso penalized logistic regression using optimal lambda
out<-logit.reg(x,y,cv$lam.opt)

#Re-estimate parameters without penalization
out2<-logit.reg(x[out$selected,],y,0)
out2$estimate



