library(vsgoftest)


### Name: vsgoftest-package
### Title: Goodness-of-Fit Tests Based on Kullback-Leibler Divergence
### Aliases: vsgoftest-package vsgoftest
### Keywords: package

### ** Examples

set.seed(1)
samp <- rnorm(50, mean = 2, s = 3)

##Estimating entropy
entropy.estimate(x = samp, window = 8)
log(2*pi*exp(1))/2 #true value of entropy of normal distribution

##Testing normality
vs.test(x = samp, densfun = 'dnorm', param = c(2,3), B = 500) #Simple null hypothesis
vs.test(x = samp, densfun='dnorm', B = 500) #Composite null hypothesis




