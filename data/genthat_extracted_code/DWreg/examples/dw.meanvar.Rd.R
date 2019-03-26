library(DWreg)


### Name: dw.meanvar
### Title: Mean and Variance of Discrete Weibull
### Aliases: dw.meanvar
### Keywords: dw.meanvar

### ** Examples

dw.meanvar(q=0.9,beta=1.5)
#compare with sample mean/variance from a random sample
x<-rdw(1000,q=0.9,beta=1.5)
mean(x)
var(x)



