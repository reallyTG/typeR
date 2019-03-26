library(DiscreteInverseWeibull)


### Name: loglikediw
### Title: likelihood function
### Aliases: loglikediw
### Keywords: distribution, htest

### ** Examples

n<-100
q<-0.4
beta<-2
x<-rdiweibull(n, q, beta)
# loglikelihood function (changed in sign) computed on the true values
loglikediw(x, q, beta)
par<-estdiweibull(x, method="H")
par
# loglikelihood function (changed in sign) computed on the ML estimates
loglikediw(x, par[1], par[2])
# it should be smaller than before...



