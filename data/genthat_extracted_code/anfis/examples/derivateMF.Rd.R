library(anfis)


### Name: derivateMF
### Title: 'derivateMF' derivate membership function
### Aliases: derivateMF derivateMF,BellMF-method
###   derivateMF,GaussianMF-method derivateMF,MembershipFunction-method
###   derivateMF,NormalizedGaussianMF-method derivateMF-methods

### ** Examples

#BellMF example I
#A bell membership function with default prototype (a=1, b=1,c=0)
#The membership of x in the bell, should be 1
#The derivate of the first parameter at x, should be 0
#The derivate of the first parameter at x, should be also 0
bell <- new(Class="BellMF")
bell
evaluateMF(object=bell, x=0)
derivateMF(object=bell, x=0, i=1)
derivateMF(object=bell, x=0, i="a")
#
#BellMF example II
#A bell membership function with parameters (a=4,b=1,c=-10)
#The membership of x in the bell, should be 0.137931
#The derivate of the first parameter at x, should be 0.05945303
#The derivate on "a" at x=0, should be 0.05945303
bell2 <- new(Class="BellMF",parameters=c(a=4,b=1,c=-10))
bell2
evaluateMF(object=bell2, x=0)
derivateMF(object=bell2, x=0, i=1)
derivateMF(object=bell2, x=0, i="a")
#GaussianMF example I
#A Gaussian membership function with default prototype (mu=0, sigma=1)
#The membership of x in the gaussian, should be 1/sqrt(2*pi) = 0.3989423
#The derivate of the first parameter at x, should be 0
#The derivate on "mu" parameter at x, should be 0
gaussian <- new(Class="GaussianMF")
gaussian
evaluateMF(object=gaussian, x=0)
derivateMF(object=gaussian, x=0, i=1)
derivateMF(object=gaussian, x=0, i="mu")
#
#GaussianMF example II
#A Gaussian membership function with parameters (mu=0, sigma=1)
#The membership of x in the Gaussian, should be 1/sqrt(2*pi) = 0.3989423
#The derivate of the first parameter at x, should be 0
#The derivate on "mu" parameter at x, should be 0
gaussian2 <- new(Class="GaussianMF",parameters=c(mu=0,sigma=1))
gaussian2
evaluateMF(object=gaussian2, x=0)
derivateMF(object=gaussian2, x=0, i=1)
derivateMF(object=gaussian2, x=0, i="mu")
#NormalizedGaussianMF example I
#A normalized Gaussian membership function with default parameters (mu=0, sigma=1)
#The derivate of the first parameter at x, should be 1
#The derivate of the first parameter at x, should be 0
#The derivate on "mu" parameter at x, should be 0
normalizedGaussian <- new(Class="NormalizedGaussianMF")
normalizedGaussian
evaluateMF(object=normalizedGaussian, x=0)
derivateMF(object=normalizedGaussian, x=0, i=1)
derivateMF(object=normalizedGaussian, x=0, i="mu")
#
#NormalizedGaussianMF example II
#A normalized Gaussian membership function with parameters (mu=0, sigma=1)
#The derivate of the first parameter at x, should be 1
#The derivate of the first parameter at x, should be 0
#The derivate on "mu" parameter at x, should be 0
normalizedGaussian2 <- new(Class="NormalizedGaussianMF",
 parameters=c(mu=0,sigma=1))
normalizedGaussian2
evaluateMF(object=normalizedGaussian2, x=0)
derivateMF(object=normalizedGaussian2, x=0, i=1)
derivateMF(object=normalizedGaussian2, x=0, i="mu")



