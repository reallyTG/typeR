library(PWEALL)


### Name: pwe
### Title: Piecewise exponential distribution: hazard, cumulative hazard,
###   density, distribution, survival
### Aliases: pwe
### Keywords: piecewise exponetial

### ** Examples

t<-seq(0,3,by=0.1)
rate<-c(0.6,0.3)
tchange<-c(0,1.75)
pwefun<-pwe(t=t,rate=rate,tchange=tchange)
pwefun



