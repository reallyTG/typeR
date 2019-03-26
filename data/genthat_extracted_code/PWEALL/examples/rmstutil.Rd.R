library(PWEALL)


### Name: rmstutil
### Title: A utility function to calculate the true restricted mean
###   survival time (RMST) and its variance account for delayed treatment,
###   discontinued treatment and non-uniform entry
### Aliases: rmstutil
### Keywords: piecewise exponential treatment crossover restricted mean
###   survival times variance

### ** Examples

r1<-c(0.6,0.3)
r2<-c(0.6,0.6)
r3<-c(0.1,0.2)
r4<-c(0.5,0.4)
r5<-c(0.4,0.5)
rc<-c(0.1,0.1)
rmt<-rmstutil(tcut=2.0,tstudy=5.0,taur=5,
        rate1=r1,rate2=r2,rate3=r3,
        rate4=r4,rate5=r5,ratec=rc,
        tchange=c(0,1),type=1,rp2=0.5,
        eps=1.0e-2,veps=1.0e-2)
rmt



