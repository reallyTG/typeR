library(bayesdistreg)


### Name: IndepMH
### Title: Independence Metropolis-Hastings Algorithm
### Aliases: IndepMH

### ** Examples

y = indicat(faithful$waiting,70)
x = scale(cbind(faithful$eruptions,faithful$eruptions^2))
data = data.frame(y,x); propob<- lapl_aprx(y,x)
IndepMH_n<- IndepMH(data=data,propob,iter = 102, burn = 2) # prior="Normal"
IndepMH_u<- IndepMH(data=data,propob,prior="Uniform",iter = 102, burn = 2) # prior="Uniform"
par(mfrow=c(3,1));invisible(apply(IndepMH_n$Matpram,2,function(x)plot(density(x))))
invisible(apply(IndepMH_u$Matpram,2,function(x)plot(density(x))));par(mfrow=c(1,1))




