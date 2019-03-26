library(FastHCS)


### Name: FastHCS
### Title: Performs the FastHCS algorithm for robust PCA.
### Aliases: FastHCS
### Keywords: multivariate robust

### ** Examples

## testing outlier detection
n<-100
p<-30
Q<-5
set.seed(123)
x0<-matrix(rnorm(n*p),nc=p)
x0[1:30,]<-matrix(rnorm(30*p,4.5,1/100),nc=p)
z<-c(rep(0,30),rep(1,70))
nStarts<-FHCSnumStarts(q=Q,eps=0.4)
Fit<-FastHCS(x=x0,nSamp=nStarts,q=Q)
z[Fit$best]
plot(Fit,col=(!z)+1,pch=16)

## testing outlier detection, different value of alpha
n<-100
p<-30
Q<-5
set.seed(123)
x0<-matrix(rnorm(n*p),nc=p)
x0[1:20,]<-matrix(rnorm(20*p,4.5,1/100),nc=p)
z<-c(rep(0,20),rep(1,80))
nStarts<-FHCSnumStarts(q=Q,eps=0.25)
Fit<-FastHCS(x=x0,nSamp=nStarts,q=Q,alpha=0.75)
z[Fit$best]


#testing exact fit
n<-100
p<-5
Q<-4
set.seed(123)
x0<-matrix(rnorm(n*p),nc=p)
x0[1:30,]<-matrix(rnorm(30*p,4.5,1/100),nc=p)
x0[31:100,4:5]<-x0[31:100,2]
z<-c(rep(0,30),rep(1,70))
nStart<-FHCSnumStarts(q=Q,eps=0.4)
results<-FastHCS(x=x0,nSamp=nStart,q=Q)
z[results$best]
results$obj

#testing rotation equivariance
n<-100
p<-10
Q<-3
set.seed(123)
x0<-scale(matrix(rnorm(n*p),nc=p))
A<-diag(rep(1,p))
A[1:2,1:2]<-c(0,1,-1,0)
x1<-x0%*%A
nStart<-FHCSnumStarts(q=Q,eps=0.4)
r0<-FastHCS(x=x0,nSamp=nStart,q=Q,seed=0)
r1<-FastHCS(x=x1,nSamp=nStart,q=Q,seed=0)
max(abs(log(r1$eigenvalues[1:Q]/r0$eigenvalues[1:Q])))



