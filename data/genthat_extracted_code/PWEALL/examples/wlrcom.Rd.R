library(PWEALL)


### Name: wlrcom
### Title: A function to calculate the various weighted log-rank statistics
###   and their varainces
### Aliases: wlrcom
### Keywords: weighted log-rank

### ** Examples

n<-1000
pi1<-0.5
taur<-2.8
u<-c(1/taur,1/taur)
ut<-c(taur/2,taur)
r11<-c(1,0.5)
r21<-c(0.5,0.8)
r31<-c(0.7,0.4)
r41<-r51<-r21
rc1<-c(0.5,0.6)
r10<-c(1,0.7)
r20<-c(0.5,1)
r30<-c(0.3,0.4)
r40<-r50<-r20
rc0<-c(0.2,0.4)
tchange<-c(0,1.873)
tcut<-2

E<-T<-C<-z<-delta<-rep(0,n)
E<-rpwu(nr=n,u=u,ut=ut)$r
z<-rbinom(n,1,pi1)
n1<-sum(z)
n0<-sum(1-z)
C[z==1]<-rpwe(nr=n1,rate=rc1,tchange=tchange)$r
C[z==0]<-rpwe(nr=n0,rate=rc0,tchange=tchange)$r
T[z==1]<-rpwecx(nr=n1,rate1=r11,rate2=r21,rate3=r31,
                rate4=r41,rate5=r51,tchange=tchange,type=1)$r
T[z==0]<-rpwecx(nr=n0,rate1=r10,rate2=r20,rate3=r30,
                rate4=r40,rate5=r50,tchange=tchange,type=1)$r
y<-pmin(pmin(T,C),tcut-E)
y1<-pmin(C,tcut-E)
d<-rep(0,n);
d[T<=y]<-1

wlr4<-wlrcom(y=y,d=d,z=z,p=c(1,1),q=c(0,1))
wlr4



