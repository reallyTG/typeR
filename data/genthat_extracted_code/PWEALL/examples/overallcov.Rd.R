library(PWEALL)


### Name: overallcov
### Title: calculate the overall covariance
### Aliases: overallcov
### Keywords: piecewise exponential piecewise uniform delayed treatment
###   effect treatment crossover

### ** Examples

taur<-1.2
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
getcov<-overallcov(tfix=2.0,tfix0=1.0,taur=taur,u=u,ut=ut,pi1=0.5,
              rate11=r11,rate21=r21,rate31=r31,
              rate41=r41,rate51=r51,ratec1=rc1,
              rate10=r10,rate20=r20,rate30=r30,
              rate40=r40,rate50=r50,ratec0=rc0,
              tchange=c(0,1),type1=1,type0=1,
              eps=1.0e-2,veps=1.0e-2,beta=0,beta0=0)
getcov$covbeta



