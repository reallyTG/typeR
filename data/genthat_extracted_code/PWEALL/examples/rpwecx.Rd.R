library(PWEALL)


### Name: rpwecx
### Title: Piecewise exponential distribution with crossover effect: random
###   number generation
### Aliases: rpwecx
### Keywords: piecewise exponential treatment crossover random number
###   generator

### ** Examples

r1<-c(0.6,0.3)
r2<-c(0.6,0.6)
r3<-c(0.1,0.2)
r4<-c(0.5,0.4)
r5<-c(0.4,0.5)
pwecxr<-rpwecx(nr=10,rate1=r1,rate2=r2,rate3=r3,rate4=r4,rate5=r5,tchange=c(0,1),type=1)
pwecxr$r



