library(PWEALL)


### Name: rmstcov
### Title: Calculation of the variance and covariance of estimated
###   restricted mean survival time
### Aliases: rmstcov
### Keywords: piecewise exponential treatment crossover restricted mean
###   survival times covariance

### ** Examples

r1<-c(0.6,0.3)
r2<-c(0.6,0.6)
r3<-c(0.1,0.2)
r4<-c(0.5,0.4)
r5<-c(0.4,0.5)
rc<-c(0.1,0.1)
rmcov<-rmstcov(t1cut=2.0,t1study=2.5,t2cut=3.0,t2study=3.5,taur=5,
        rate1=r1,rate2=r2,rate3=r3,rate4=r4,rate5=r5,ratec=rc,
        tchange=c(0,1),type=1)
rmcov



