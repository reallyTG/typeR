library(FastRCS)


### Name: FastRCS
### Title: Computes the FastRCS outlyingness index for regression.
### Aliases: FastRCS
### Keywords: regression robust

### ** Examples

## testing outlier detection
set.seed(123)
n<-100
p<-3
x0<-matrix(rnorm(n*p),nc=p)
y0<-rnorm(n)
z<-c(rep(0,30),rep(1,70))
x0[1:30,]<-matrix(rnorm(30*p,5,1/100),nc=p)
y0[1:30]<-rnorm(30,10,1/100)
ns<-FRCSnumStarts(p=p,eps=0.4);
results<-FastRCS(x=x0,y=y0,alpha=0.5,nSamp=ns)
z[results$best]

## testing outlier detection, different value of alpha
set.seed(123)
n<-100
p<-3
x0<-matrix(rnorm(n*p),nc=p)
y0<-rnorm(n)
z<-c(rep(0,20),rep(1,80))
x0[1:20,]<-matrix(rnorm(20*p,5,1/100),nc=p)
y0[1:20]<-rnorm(20,10,1/100)
ns<-FRCSnumStarts(p=p,eps=0.25);
results<-FastRCS(x=x0,y=y0,alpha=0.75,nSamp=ns)
z[results$best]



#testing exact fit
set.seed(123)
n<-100
p<-3
x0<-matrix(rnorm(n*p),nc=p)
y0<-rep(1,n)
z<-c(rep(0,30),rep(1,70))
x0[1:30,]<-matrix(rnorm(30*p,5,1/100),nc=p)
y0[1:30]<-rnorm(30,10,1/100)
ns<-FRCSnumStarts(p=p,eps=0.4);
results<-FastRCS(x=x0,y=y0,alpha=0.5,nSamp=ns,seed=1)
z[results$rawBest]
results$obj

#testing regression equivariance
n<-100
p<-3
x0<-matrix(rnorm(n*(p-1)),nc=p-1)
y0<-rnorm(n)
ns<-FRCSnumStarts(p=p,eps=0.4);
y1<-y0+cbind(1,x0)%*%rep(-1,p)
results1<-FastRCS(y=y0,x=x0,nSamp=ns,seed=1)$coefficients
results2<-FastRCS(y=y1,x=x0,nSamp=ns,seed=1)$coefficients
results1+rep(-1,p)
#should be the same:
results2



