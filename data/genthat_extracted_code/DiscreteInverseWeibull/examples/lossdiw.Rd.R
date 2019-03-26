library(DiscreteInverseWeibull)


### Name: lossdiw
### Title: Loss function
### Aliases: lossdiw
### Keywords: distribution

### ** Examples

n<-100
q<-0.5
beta<-2.5
x<-rdiweibull(n, q, beta)
# loss function computed on the true values
lossdiw(x, c(q, beta))
par<-estdiweibull(x, method="M")
# estimates of the parameters through the method of moments
par
# loss function computed on the estimates derived through
# the method of moments
lossdiw(x, par)
# it should be zero (however, smaller than before...)



