library(bpcp)


### Name: kmtestALL
### Title: Pointwise confidence intervals for survival for right censored
###   data.
### Aliases: kmtestALL kmciBorkowf kmtestConstrainBoot kmtestConstrainBeta
###   bpcp kmciSW kmciTG kmci1TG kmtestBoot
### Keywords: htest survival nonparametric

### ** Examples

library(bpcp)
data(leuk)

### Recommended method is bpcp
### since the data are truncated to the nearest integer
### use Delta=1 option
out<-bpcp(leuk$time,leuk$status,Delta=1)
summary(out)
median(out)
plot(out)



### Borkowf 2005 method
norm<-kmciBorkowf(leuk$time,leuk$status,type="norm")
norms<-kmciBorkowf(leuk$time,leuk$status,type="norms")
## check Table VII of Borkowf
I<-c(1,2,3,5,7,8,9,11,13,15,17,19,21,23,25,27,29,31,33)
round(data.frame(lowerNorm=norm$lower[I],
    upperNorm=norm$upper[I],lowerNormS=norms$lower[I],
    upperNorms=norms$upper[I],row.names=norm$Interval[I]),3)

### Strawderman and Wells (1997) method
swci<-kmciSW(leuk$time,leuk$status)
summary(swci)


### Thomas and Grunkemeier 1975 method
x<-kmciTG(leuk$time,leuk$status)
summary(x)
## compare to Table 1, Sample 2, of Thomas and Grunkemeier (1975)
StCI(x,c(10,20))





