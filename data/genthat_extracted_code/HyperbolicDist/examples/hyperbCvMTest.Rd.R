library(HyperbolicDist)


### Name: hyperbCvMTest
### Title: Cramer-von~Mises Test of a Hyperbolic Distribution
### Aliases: hyperbCvMTest hyperbCvMTestPValue print.hyperbCvMTest
### Keywords: htest print

### ** Examples

Theta <- c(2,2,2,2)
dataVector <- rhyperb(500, Theta)
fittedTheta <- hyperbFit(dataVector)$Theta
hyperbCvMTest(dataVector, fittedTheta)
dataVector <- rnorm(1000)
fittedTheta <- hyperbFit(dataVector, startValues = "FN")$Theta
hyperbCvMTest(dataVector, fittedTheta)



