library(anfis)


### Name: NormalizedGaussianMF-class
### Title: NormalizedGaussianMF Membership Function S4 class
### Aliases: NormalizedGaussianMF NormalizedGaussianMF-class

### ** Examples

#NormalizedGaussianMF example I
#A normalized Gaussian membership function with default paramateres (mu=0, sigma=1)
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



