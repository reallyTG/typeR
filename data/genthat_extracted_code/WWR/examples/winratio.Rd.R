library(WWR)


### Name: winratio
### Title: Win Loss Statistics
### Aliases: winratio
### Keywords: win ratio pairwise comparison

### ** Examples

n<-300
rho<-0.5
b2<-0.2
b1<-0.5
bc<-1.0
lambda10<-0.1;lambda20<-0.08;lambdac0<-0.09
lam1<-rep(0,n);lam2<-rep(0,n);lamc<-rep(0,n)
z<-rep(0,n)
z[1:(n/2)]<-1

lam1<-lambda10*exp(-b1*z)
lam2<-lambda20*exp(-b2*z)
lamc<-lambdac0*exp(-bc*z)
tem<-matrix(0,ncol=3,nrow=n)

y2y<-matrix(0,nrow=n,ncol=3)
y2y[,1]<-rnorm(n);y2y[,3]<-rnorm(n)
y2y[,2]<-rho*y2y[,1]+sqrt(1-rho^2)*y2y[,3]
tem[,1]<--log(1-pnorm(y2y[,1]))/lam1
tem[,2]<--log(1-pnorm(y2y[,2]))/lam2
tem[,3]<--log(1-runif(n))/lamc

y1<-apply(tem,1,min)
y2<-apply(tem[,2:3],1,min)
d1<-as.numeric(tem[,1]<=y1)
d2<-as.numeric(tem[,2]<=y2)
wtest<-winratio(y1,y2,d1,d2,z)
summary(wtest)



