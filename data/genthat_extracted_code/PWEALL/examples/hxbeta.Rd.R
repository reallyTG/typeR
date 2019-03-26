library(PWEALL)


### Name: hxbeta
### Title: A function to calculate the beta-smoothed hazard rate
### Aliases: hxbeta
### Keywords: smoothed estimate hazard estimate

### ** Examples

n<-200
taur<-2.8
u<-c(1/taur,1/taur)
ut<-c(taur/2,taur)
tfix<-taur+2
tseq<-seq(0,tfix,by=0.1)
r11<-c(1,0.5)
r21<-c(0.5,0.8)
r31<-c(0.7,0.4)
r41<-r51<-r21
rc1<-c(0.5,0.6)
tchange<-c(0,1.873)

E<-T<-C<-d<-rep(0,n)
E<-rpwu(nr=n,u=u,ut=ut)$r
C<-rpwe(nr=n,rate=rc1,tchange=tchange)$r
T<-rpwecx(nr=n,rate1=r11,rate2=r21,rate3=r31,
               rate4=r41,rate5=r51,tchange=tchange,type=1)$r
y<-pmin(pmin(T,C),tfix-E)
y1<-pmin(C,tfix-E)
d[T<=y]<-1

lambda=hxbeta(x=tseq,y=y,d=d,tfix=tfix,K=20,eps=1.0e-06)$lambda
lambda



