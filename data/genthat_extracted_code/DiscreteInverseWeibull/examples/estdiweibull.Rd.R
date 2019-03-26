library(DiscreteInverseWeibull)


### Name: estdiweibull
### Title: Estimation of parameters
### Aliases: estdiweibull
### Keywords: distribution, htest

### ** Examples

n<-100 
q<-0.5 
beta<-2.5
# generation of a sample
x<-rdiweibull(n, q, beta)
# sample estimation through each of the implemented methods
estdiweibull(x, method="P") 
estdiweibull(x, method="M")
estdiweibull(x, method="H")
estdiweibull(x, method="PP")



