library(fda.usc)


### Name: Var.y
### Title: Sampling Variance estimates
### Aliases: Var.y Var.e

### ** Examples


a1<-seq(0,1,by=.01)
a2=rnorm(length(a1),sd=0.2)
f1<-(sin(2*pi*a1))+rnorm(length(a1),sd=0.2)
nc<-50
np<-length(f1)
tt=1:101
mdata<-matrix(NA,ncol=np,nrow=nc)
for (i in 1:nc) mdata[i,]<- (sin(2*pi*a1))+rnorm(length(a1),sd=0.2)
mdata<-fdata(mdata,tt)
S=S.NW(tt,h=0.15)
var.e<-Var.e(mdata,S)
var.y<-Var.y(mdata,S)
var.y2<-Var.y(mdata,S,var.e) #the same



