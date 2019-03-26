library(PWEALL)


### Name: pwepowerfindt
### Title: Calculating the timepoint where a certain power of the specified
###   test statistics is obtained
### Aliases: pwepowerfindt
### Keywords: piecewise exponential overall hazard ratio piecewise uniform
###   delayed treatment effect treatment crossover timeline for certain
###   power

### ** Examples

t<-seq(3,6,by=1)
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
getpower<-pwepower(t=t,alpha=0.05,twosided=1,taur=taur,u=u,ut=ut,pi1=0.5,
                   rate11=r11,rate21=r21,rate31=r31,rate41=r41,rate51=r51,ratec1=rc1,
                   rate10=r10,rate20=r20,rate30=r30,rate40=r40,rate50=r50,ratec0=rc0,
                   tchange=c(0,1),type1=1,type0=1,n=1000)
###powers at each time point
cbind(t,getpower$power[,1:3])

###90% power should be in (3,3.5)
getpwtime<-pwepowerfindt(power=0.9,alpha=0.05,twosided=1,tupp=3.5,tlow=3,taur=taur,
        u=u,ut=ut,pi1=0.5,rate11=r11,rate21=r21,rate31=r31,rate41=r41,rate51=r51,ratec1=rc1,
        rate10=r10,rate20=r20,rate30=r30,rate40=r40,rate50=r50,ratec0=rc0,
        tchange=c(0,1),type1=1,type0=1,n=1000,testtype=1,maxiter=30)
getpwtime



