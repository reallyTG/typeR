library(bayesdistreg)


### Name: RWMH
### Title: Random Walk Metropolis-Hastings Algorithm
### Aliases: RWMH

### ** Examples

y = indicat(faithful$waiting,70)
x = scale(cbind(faithful$eruptions,faithful$eruptions^2))
data = data.frame(y,x); propob<- lapl_aprx(y,x)
RWMHob_n<- RWMH(data=data,propob,iter = 102, burn = 2) # prior="Normal"
RWMHob_u<- RWMH(data=data,propob,prior="Uniform",iter = 102, burn = 2)
par(mfrow=c(3,1));invisible(apply(RWMHob_n$Matpram,2,function(x)plot(density(x))))
invisible(apply(RWMHob_u$Matpram,2,function(x)plot(density(x))));par(mfrow=c(1,1))




