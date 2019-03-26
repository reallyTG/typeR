library(PWEALL)


### Name: rmstpowerfindt
### Title: Calculating the timepoint where a certain power of mean
###   difference of RMSTs is obtained
### Aliases: rmstpowerfindt
### Keywords: piecewise exponential piecewise uniform delayed treatment
###   effect treatment crossover timeline for certain power mean difference
###   of RMSTs power

### ** Examples

tcut<-3.0
tstudy<-seq(3,6,by=0.2)
taur<-2
u<-c(0.3,0.7)
ut<-c(taur/2,taur)
r11<-c(0.2,0.1)
r21<-r11
r31<-c(0.03,0.02)
r41<-r51<-r21
rc1<-c(0.05,0.04)
r10<-c(0.22,0.22)
r20<-r10
r30<-c(0.02,0.01)
r40<-r50<-r20
rc0<-c(0.04,0.05)
ntotal<-1200
getrmst<-rmstpower(tcut=tcut,tstudy=tstudy,alpha=0.05,twosided=1,
        taur=taur,u=u,ut=ut,pi1=0.5,
        rate11=r11,rate21=r21,rate31=r31,rate41=r41,rate51=r51,ratec1=rc1,
        rate10=r10,rate20=r20,rate30=r30,rate40=r40,rate50=r50,ratec0=rc0,
        tchange=c(0,1),type1=1,type0=1,rp21=0.5,rp20=0.5,n=ntotal)
###powers at each time point
cbind(tstudy,getrmst$power)

###90 percent power should be in (3,4)
gettime<-rmstpowerfindt(power=0.9,alpha=0.05,twosided=1,tcut=tcut,tupp=4,tlow=3.0,taur=taur,
          u=u,ut=ut,pi1=0.5,rate11=r11,rate21=r21,rate31=r31,rate41=r41,rate51=r51,ratec1=rc1,
          rate10=r10,rate20=r20,rate30=r30,rate40=r40,rate50=r50,ratec0=rc0,
          tchange=c(0,1),type1=1,type0=1,rp21=0.5,rp20=0.5,eps=1.0e-2,veps=1.0e-2,
          n=ntotal,maxiter=20,itereps=0.0001)
gettime



