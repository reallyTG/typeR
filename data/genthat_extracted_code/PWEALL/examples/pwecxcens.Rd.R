library(PWEALL)


### Name: pwecxcens
### Title: Integration of the density of piecewise exponential distribution
###   with crossover effect and the censoring function
### Aliases: pwecxcens
### Keywords: piecewise exponential treatment crossover piecewise uniform

### ** Examples

r1<-c(0.6,0.3)
r2<-c(0.6,0.6)
r3<-c(0.1,0.2)
r4<-c(0.5,0.4)
r5<-c(0.4,0.5)
rc<-c(0.5,0.6)
exu<-pwecxcens(t=seq(0,10,by=0.5),rate1=r1,rate2=r2,
               rate3=r3,rate4=r4,rate5=r5,ratec=rc,
               tchange=c(0,1),type=1,eps=1.0e-2)
c(exu$du,exu$duprime)



