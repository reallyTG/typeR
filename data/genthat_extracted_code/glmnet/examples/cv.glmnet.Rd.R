library(glmnet)


### Name: cv.glmnet
### Title: Cross-validation for glmnet
### Aliases: cv.glmnet
### Keywords: models regression

### ** Examples

set.seed(1010)
n=1000;p=100
nzc=trunc(p/10)
x=matrix(rnorm(n*p),n,p)
beta=rnorm(nzc)
fx= x[,seq(nzc)] %*% beta
eps=rnorm(n)*5
y=drop(fx+eps)
px=exp(fx)
px=px/(1+px)
ly=rbinom(n=length(px),prob=px,size=1)
set.seed(1011)
cvob1=cv.glmnet(x,y)
plot(cvob1)
coef(cvob1)
predict(cvob1,newx=x[1:5,], s="lambda.min")
title("Gaussian Family",line=2.5)
set.seed(1011)
cvob1a=cv.glmnet(x,y,type.measure="mae")
plot(cvob1a)
title("Gaussian Family",line=2.5)
set.seed(1011)
par(mfrow=c(2,2),mar=c(4.5,4.5,4,1))
cvob2=cv.glmnet(x,ly,family="binomial")
plot(cvob2)
title("Binomial Family",line=2.5)
frame()
set.seed(1011)
cvob3=cv.glmnet(x,ly,family="binomial",type.measure="class")
plot(cvob3)
title("Binomial Family",line=2.5)
## Not run: 
##D set.seed(1011)
##D cvob3a=cv.glmnet(x,ly,family="binomial",type.measure="auc")
##D plot(cvob3a)
##D title("Binomial Family",line=2.5)
##D set.seed(1011)
##D mu=exp(fx/10)
##D y=rpois(n,mu)
##D cvob4=cv.glmnet(x,y,family="poisson")
##D plot(cvob4)
##D title("Poisson Family",line=2.5)
##D 
##D # Multinomial
##D n=500;p=30
##D nzc=trunc(p/10)
##D x=matrix(rnorm(n*p),n,p)
##D beta3=matrix(rnorm(30),10,3)
##D beta3=rbind(beta3,matrix(0,p-10,3))
##D f3=x%*% beta3
##D p3=exp(f3)
##D p3=p3/apply(p3,1,sum)
##D g3=rmult(p3)
##D set.seed(10101)
##D cvfit=cv.glmnet(x,g3,family="multinomial")
##D plot(cvfit)
##D title("Multinomial Family",line=2.5)
##D # Cox
##D beta=rnorm(nzc)
##D fx=x[,seq(nzc)]%*%beta/3
##D hx=exp(fx)
##D ty=rexp(n,hx)
##D tcens=rbinom(n=n,prob=.3,size=1)# censoring indicator
##D y=cbind(time=ty,status=1-tcens) # y=Surv(ty,1-tcens) with library(survival)
##D foldid=sample(rep(seq(10),length=n))
##D fit1_cv=cv.glmnet(x,y,family="cox",foldid=foldid)
##D plot(fit1_cv)
##D title("Cox Family",line=2.5)
##D # Parallel
##D require(doMC)
##D registerDoMC(cores=4)
##D x = matrix(rnorm(1e5 * 100), 1e5, 100)
##D y = rnorm(1e5)
##D system.time(cv.glmnet(x,y))
##D system.time(cv.glmnet(x,y,parallel=TRUE))
## End(Not run)



