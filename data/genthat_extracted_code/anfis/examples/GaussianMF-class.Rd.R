library(anfis)


### Name: GaussianMF-class
### Title: GaussianMF Membership Function S4 class
### Aliases: GaussianMF GaussianMF-class

### ** Examples

#GaussianMF example I
#A Gaussian membership function with default prototype (mu=0, sigma=1)
#The membership of x in the Gaussian, should be 1/sqrt(2*pi) = 0.3989423
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



