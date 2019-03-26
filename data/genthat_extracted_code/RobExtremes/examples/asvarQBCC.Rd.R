library(RobExtremes)


### Name: asvarQBCC
### Title: Function to compute asymptotic variance of QuantileBCC estimator
### Aliases: asvarQBCC
### Keywords: asymptotic variance

### ** Examples

GP <- WeibullFamily(scale=1,shape=0.7)
asvarQBCC(GP)
asvarQBCC(GP, p1=1/4, p2= 5/8)



