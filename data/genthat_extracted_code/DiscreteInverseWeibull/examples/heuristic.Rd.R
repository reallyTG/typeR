library(DiscreteInverseWeibull)


### Name: heuristic
### Title: Heuristic method of estimation
### Aliases: heuristic
### Keywords: distribution, htest

### ** Examples

n<-50
q<-0.25
beta<-1.5
x<-rdiweibull(n, q, beta)
# estimates using the heuristic algorithm
par0<-heuristic(x)
par0
# change the default values of some working parameters...
par1<-heuristic(x, beta1=2)
par1
par2<-heuristic(x, z=0.5)
par2
par3<-heuristic(x, r=0.2)
par3
par4<-heuristic(x, Leps=0.1)
par4
# ...there should be just light differences among the estimates...
# ... and among the corresponding values of the loglikelihood functions
loglikediw(x, par0[1], par0[2])
loglikediw(x, par1[1], par1[2])
loglikediw(x, par2[1], par2[2])
loglikediw(x, par3[1], par3[2])
loglikediw(x, par4[1], par4[2])



