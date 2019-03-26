library(PWEALL)


### Name: pwefvplus
### Title: A utility functon
### Aliases: pwefvplus
### Keywords: piecewise exponential treatment crossover

### ** Examples

r1<-c(0.6,0.3)
r2<-c(0.6,0.6)
r3<-c(0.1,0.2)
r4<-c(0.5,0.4)
r5<-c(0.4,0.5)
r6<-c(0.4,0.5)
tchange<-c(0,1.75)
pwefun<-pwefvplus(t=seq(0,5,by=0.5),rate1=r1,rate2=r2,rate3=r3,
                 rate4=r4,rate5=r5,rate6=r6,
                 tchange=c(0,3),type=1,eps=1.0e-2)
pwefun



