library(GeneralizedHyperbolic)


### Name: nigFitStart
### Title: Find Starting Values for Fitting a normal inverse Gaussian
###   Distribution
### Aliases: nigFitStart nigFitStartMoM
### Keywords: distribution

### ** Examples

param <- c(2, 2, 2, 1)
dataVector <- rnig(500, param = param)
nigFitStart(dataVector, startValues = "FN")
nigFitStartMoM(dataVector)
nigFitStart(dataVector, startValues = "MoM")



