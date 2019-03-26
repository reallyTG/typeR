library(fractal)


### Name: timeLag
### Title: Estimate the proper time lag for single variable delay
###   embeddings
### Aliases: timeLag
### Keywords: univar models nonlinear

### ** Examples

## estimate the proper time lag for an embedding 
## of the beamchaos data using the first zero 
## crossing of the ACF 
as.numeric(timeLag(beamchaos, method="acfzero", plot=TRUE))



