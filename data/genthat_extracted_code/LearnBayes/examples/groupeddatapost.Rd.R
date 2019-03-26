library(LearnBayes)


### Name: groupeddatapost
### Title: Log posterior of normal parameters when data is in grouped form
### Aliases: groupeddatapost
### Keywords: models

### ** Examples

int.lo=c(-Inf,10,15,20,25)
int.hi=c(10,15,20,25,Inf)
f=c(2,5,8,4,2)
data=list(int.lo=int.lo,int.hi=int.hi,f=f)
theta=c(20,1)
groupeddatapost(theta,data)



