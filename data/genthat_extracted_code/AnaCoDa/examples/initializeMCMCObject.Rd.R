library(AnaCoDa)


### Name: initializeMCMCObject
### Title: Initialize MCMC
### Aliases: initializeMCMCObject

### ** Examples


## initializing an object of type mcmc

samples <- 2500
thinning <- 50
adaptiveWidth <- 25

## estimate all parameter types
mcmc <- initializeMCMCObject(samples = samples, thinning = thinning, adaptive.width=adaptiveWidth, 
                             est.expression=TRUE, est.csp=TRUE, est.hyper=TRUE, est.mix = TRUE) 
                             
## do not estimate expression values, initial conditions will remain constant
mcmc <- initializeMCMCObject(samples = samples, thinning = thinning, adaptive.width=adaptiveWidth, 
                             est.expression=FALSE, est.csp=TRUE, est.hyper=TRUE, est.mix = TRUE) 
                             
## do not estimate hyper parameters, initial conditions will remain constant
mcmc <- initializeMCMCObject(samples = samples, thinning = thinning, adaptive.width=adaptiveWidth, 
                             est.expression=TRUE, est.csp=TRUE, est.hyper=FALSE, est.mix = TRUE) 




