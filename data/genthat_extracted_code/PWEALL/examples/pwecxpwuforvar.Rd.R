library(PWEALL)


### Name: pwecxpwuforvar
### Title: calculate the utility function used for varaince calculation
### Aliases: pwecxpwuforvar
### Keywords: piecewise exponential overall hazard ratio piecewise uniform
###   delayed treatment effect treatment crossover

### ** Examples

taur<-1.2
u<-c(1/taur,1/taur)
ut<-c(taur/2,taur)
r11<-c(1,0.5)
r21<-c(0.5,0.8)
r31<-c(0.7,0.4)
r41<-r51<-r21
rc1<-c(0.5,0.6)
getf<-pwecxpwuforvar(tfix=3,t=seq(0,3,by=1),taur=taur,u=u,ut=ut,
                 rate1=r11,rate2=r21,rate3=r31,rate4=r41,rate5=r51,ratec=rc1,
                 tchange=c(0,1),type=1,eps=1.0e-2)
getf



