library(PWEALL)


### Name: qpwe
### Title: Piecewise exponential distribution: quantile function
### Aliases: qpwe
### Keywords: piecewise exponential quantiles

### ** Examples

p<-seq(0,1,by=0.1)
rate<-c(0.6,0.3)
tchange<-c(0,1.75)
pweq<-qpwe(p=p,rate=rate,tchange=tchange)
pweq



