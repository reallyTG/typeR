library(WWR)


### Name: wlogr2
### Title: Log-rank statistics
### Aliases: wlogr2
### Keywords: log-rank Gehan

### ** Examples

n<-300
b<-0.2
bc<-1.0
lambda0<-0.1;lambdac0<-0.09
lam<-rep(0,n);lamc<-rep(0,n)
z<-rep(0,n)
z[1:(n/2)]<-1

lam<-lambda0*exp(-b*z)
lamc<-lambdac0*exp(-bc*z)
tem<-matrix(0,ncol=2,nrow=n)

tem[,1]<--log(1-runif(n))/lam
tem[,2]<--log(1-runif(n))/lamc

y<-apply(tem,1,min)
d<-as.numeric(tem[,1]<=y)

i<-1 ##i=1,2
wtest<-wlogr2(y,d,z,wty=i)
wtest



