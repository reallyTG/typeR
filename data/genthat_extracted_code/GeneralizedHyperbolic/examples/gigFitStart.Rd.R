library(GeneralizedHyperbolic)


### Name: gigFitStart
### Title: Find Starting Values for Fitting a Generalized Inverse Gaussian
###   Distribution
### Aliases: gigFitStart gigFitStartMoM gigFitStartLM
### Keywords: distribution

### ** Examples

param <- c(1, 1, 1)
dataVector <- rgig(500, param = param)
gigFitStart(dataVector)



