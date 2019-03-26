library(FitAR)


### Name: Get1G
### Title: Internal Utility Function: BLUE Mean
### Aliases: Get1G
### Keywords: ts

### ** Examples

#Simulate an AR(2) and compute the exact mle for mean
set.seed(7771111)
n<-50
phi<-c(1.8,-0.9)
z<-SimulateGaussianAR(phi, n)
g1<-Get1G(phi, length(z))
sum(g1*z)/sum(g1)
#sample mean
mean(z)
#more directly with getArMu
GetARMeanMLE(z,phi)



