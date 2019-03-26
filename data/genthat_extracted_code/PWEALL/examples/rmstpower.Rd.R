library(PWEALL)


### Name: rmstpower
### Title: Calculate powers at different cut-points based on difference of
###   restricted mean survival times (RMST)
### Aliases: rmstpower
### Keywords: piecewise exponential distribution crossover effect delayed
###   treatment effect restricted mean survival time mean difference
###   variance

### ** Examples

tcut<-3.0
tstudy<-seq(3,6,by=1)
taur<-1.2
u<-c(1/taur,1/taur)
ut<-c(taur/2,taur)
r11<-c(0.2,0.1)
r21<-r11
r31<-c(0.03,0.02)
r41<-r51<-r21
rc1<-c(0.01,0.02)
r10<-c(0.2,0.2)
r20<-r10
r30<-c(0.02,0.01)
r40<-r50<-r20
rc0<-c(0.02,0.01)
getrmst<-rmstpower(tcut=tcut,tstudy=tstudy,alpha=0.05,twosided=1,
          taur=taur,u=u,ut=ut,pi1=0.5,
          rate11=r11,rate21=r21,rate31=r31,rate41=r41,rate51=r51,ratec1=rc1,
          rate10=r10,rate20=r20,rate30=r30,rate40=r40,rate50=r50,ratec0=rc0,
          tchange=c(0,1),type1=1,type0=1,rp21=0.5,rp20=0.5,n=1000)
###powers at each time point
cbind(tstudy,getrmst$power)



