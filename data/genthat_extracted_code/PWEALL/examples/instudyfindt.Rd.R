library(PWEALL)


### Name: instudyfindt
### Title: calculate the timeline in study when some or all subjects have
###   entered
### Aliases: instudyfindt
### Keywords: piecewise exponential timeline piecewise uniform delayed
###   treatment effect treatment crossover

### ** Examples

n<-1000
target<-550
ntotal<-1000
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

####generate the data
E<-T<-C<-Z<-delta<-rep(0,n)
E<-rpwu(nr=n,u=u,ut=ut)$r
Z<-rbinom(n,1,pi1)
n1<-sum(Z)
n0<-sum(1-Z)
C[Z==1]<-rpwe(nr=n1,rate=rc1,tchange=tchange)$r
C[Z==0]<-rpwe(nr=n0,rate=rc0,tchange=tchange)$r
T[Z==1]<-rpwecx(nr=n1,rate1=r11,rate2=r21,rate3=r31,
                rate4=r41,rate5=r51,tchange=tchange,type=1)$r
T[Z==0]<-rpwecx(nr=n0,rate1=r10,rate2=r20,rate3=r30,
                rate4=r40,rate5=r50,tchange=tchange,type=1)$r
y<-pmin(pmin(T,C),tcut-E)
y1<-pmin(C,tcut-E)
delta[T<=y]<-1
delta[C<=y]<-0
delta[tcut-E<=y & tcut-E>0]<-2
delta[tcut-E<=y & tcut-E<=0]<--1

ys<-y[delta>-1]
Zs<-Z[delta>-1]
ds<-delta[delta>-1]

nplus<-sum(delta==-1)
nd0<-sum(ds==0)
nd1<-sum(ds==1)
nd2<-sum(ds==2)


ntaur<-taur-tcut
nu<-c(1/ntaur,1/ntaur)
nut<-c(ntaur/2,ntaur)

###calculate the timeline at baseline
xt<-pwecxpwufindt(target=target,ntotal=n,taur=taur,u=u,ut=ut,pi1=pi1,
              rate11=r11,rate21=r21,rate31=r31,ratec1=rc1,
              rate10=r10,rate20=r20,rate30=r30,ratec0=rc0,
              tchange=tchange,eps=0.001,init=taur,epsilon=0.000001,maxiter=100)
###calculate the timeline in study
yt<-instudyfindt(target=target,y=ys,z=Zs,d=ds,
                       tcut=tcut,blinded=0,type1=1,type0=1,tchange=tchange,
                       rate10=r10,rate20=r20,rate30=r30,ratec0=rc0,
                       rate11=r11,rate21=r21,rate31=r31,ratec1=rc1,
                       withmorerec=1,
                       ntotal=nplus,taur=ntaur,u=nu,ut=nut,pi1=pi1,
                       ntype1=1,ntype0=1,ntchange=tchange,
                       nrate10=r10,nrate20=r20,nrate30=r30,nratec0=rc0,
                       nrate11=r11,nrate21=r21,nrate31=r31,nratec1=rc1,
                       eps=1.0e-2,init=2,epsilon=0.001,maxiter=100)
##timelines                       
c(yt$t1,xt$t1)
##standard errors of the timeline estimators 
c(sqrt(yt$tvar/yt$ny),sqrt(xt$tvar/n))
###95 percent CIs
c(yt$t1-1.96*sqrt(yt$tvar/yt$ny),yt$t1+1.96*sqrt(yt$tvar/yt$ny))
c(xt$t1-1.96*sqrt(xt$tvar/n),xt$t1+1.96*sqrt(xt$tvar/n))




