library(HyperbolicDist)


### Name: hyperbFitStart
### Title: Find Starting Values for Fitting a Hyperbolic Distribution
### Aliases: hyperbFitStart hyperbFitStartMoM
### Keywords: distribution

### ** Examples

Theta <- c(2,2,2,2)
dataVector <- rhyperb(500,Theta)
hyperbFitStart(dataVector,startValues="FN")
hyperbFitStartMoM(dataVector)
hyperbFitStart(dataVector,startValues="MoM")



