library(SunterSampling)


### Name: SunterSampling-package
### Title: Sunter sampling
### Aliases: SunterSampling-package SunterSampling
### Keywords: package

### ** Examples

# from Sarndal et al. (1992)
x<-c(40,25,20,10,5)
n<-2
pi<-sunterpi(x,n) # first order inclusion probabilities
pi2<-sunterpi2(x,n) # second order inclusion probabilities
apply(pi2,2,sum) # they should be equal to...
n*pi # OK!
sunter(x,n) # sample drawn according to Sunter's design



