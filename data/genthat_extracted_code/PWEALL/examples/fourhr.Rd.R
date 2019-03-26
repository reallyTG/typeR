library(PWEALL)


### Name: fourhr
### Title: A utility functon
### Aliases: fourhr
### Keywords: piecewise exponential treatment crossover

### ** Examples

r1<-c(0.6,0.3)
r2<-c(0.6,0.6)
r3<-c(0.1,0.2)
r4<-c(0.5,0.4)
tchange<-c(0,1.75)
fourhrfun<-fourhr(t=seq(0,5,by=0.5),rate1=r1,rate2=r2,rate3=r3,
                 rate4=r4,tchange=c(0,3),eps=1.0e-2)
fourhrfun



