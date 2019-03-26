library(GeneralizedHyperbolic)


### Name: hyperbFitStart
### Title: Find Starting Values for Fitting a Hyperbolic Distribution
### Aliases: hyperbFitStart hyperbFitStartMoM
### Keywords: distribution

### ** Examples

param <- c(2, 2, 2, 1)
dataVector <- rhyperb(500, param = param)
hyperbFitStart(dataVector, startValues = "FN")
hyperbFitStartMoM(dataVector)
hyperbFitStart(dataVector, startValues = "MoM")



