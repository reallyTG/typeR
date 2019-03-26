library(PWEALL)


### Name: pwefv2
### Title: A utility function
### Aliases: pwefv2
### Keywords: piecewise exponential

### ** Examples

r1<-c(0.6,0.3)
r2<-c(0.6,0.6)
tchange<-c(0,1.75)
pwefun<-pwefv2(t=seq(0,5,by=0.5),rate1=r1,rate2=r2,
              tchange=tchange,eps=1.0e-2)
pwefun



