library(PWEALL)


### Name: pwesim
### Title: simulating the test statistics
### Aliases: pwesim
### Keywords: piecewise exponential overall hazard ratio piecewise uniform
###   delayed treatment effect treatment crossover simulation

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
ar<-pwesim(t=seq(1,2,by=0.1),taur=taur,u=u,ut=ut,pi1=0.5,
        rate11=r11,rate21=r21,rate31=r31,rate41=r41,rate51=r51,ratec1=rc1,
        rate10=r10,rate20=r20,rate30=r30,rate40=r40,rate50=r50,ratec0=rc0,
        tchange=c(0,1),type1=1,type0=1,
        n=300,rn=10)



