library(GeneralizedHyperbolic)


### Name: ghypScale
### Title: Rescale a generalized hyperbolic distribution
### Aliases: ghypScale
### Keywords: distribution

### ** Examples

param <- c(2,10,0.1,0.07,-0.5) # a normal inverse Gaussian
ghypMean(param = param)
ghypVar(param = param)
## convert to standardized parameters
(newParam <- ghypScale(0, 1, param = param))
ghypMean(param = newParam)
ghypVar(param = newParam)

## try some other mean and sd
(newParam <- ghypScale(1, 1, param = param))
ghypMean(param = newParam)
sqrt(ghypVar(param = newParam))
(newParam <- ghypScale(10, 2, param = param))
ghypMean(param = newParam)
sqrt(ghypVar(param = newParam))



