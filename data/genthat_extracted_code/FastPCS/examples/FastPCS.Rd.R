library(FastPCS)


### Name: FastPCS
### Title: Computes the FastPCS multivariate outlyingness index.
### Aliases: FastPCS
### Keywords: multivariate robust

### ** Examples

## testing outlier detection 
set.seed(123)
n<-100
p<-3
x0<-matrix(rnorm(n*p),nc=p)
x0[1:30,]<-matrix(rnorm(30*p,4.5,1/100),nc=p)
z<-c(rep(0,30),rep(1,70))
nstart<-FPCSnumStarts(p=p,eps=0.4)
results<-FastPCS(x=x0,nSamp=nstart)
z[results$best]

## testing outlier detection, different value of alpha
set.seed(123)
n<-100
p<-3
x0<-matrix(rnorm(n*p),nc=p)
x0[1:20,]<-matrix(rnorm(20*p,4.5,1/100),nc=p)
z<-c(rep(0,20),rep(1,80))
nstart<-FPCSnumStarts(p=p,eps=0.25)
results<-FastPCS(x=x0,nSamp=nstart,alpha=0.75)
z[results$best]

#testing exact fit
set.seed(123)
n<-100
p<-3
x0<-matrix(rnorm(n*p),nc=p)
x0[1:30,]<-matrix(rnorm(30*p,5,1/100),nc=p)
x0[31:100,3]<-x0[31:100,2]*2+1
z<-c(rep(0,30),rep(1,70))
nstart<-FPCSnumStarts(p=p,eps=0.4)
results<-FastPCS(x=x0,nSamp=nstart)
z[results$rawBest]
results$obj

#testing affine equivariance
n<-100
p<-3
set.seed(123)
x0<-matrix(rnorm(n*p),nc=p)
nstart<-500
results1<-FastPCS(x=x0,nSamp=nstart,seed=1)
a1<-matrix(0.9,p,p)
diag(a1)<-1
x1<-x0%*%a1
results2<-FastPCS(x=x1,nSamp=nstart,seed=1)
results2$center
results2$cov
#should be the same
results1$center%*%a1
a1




