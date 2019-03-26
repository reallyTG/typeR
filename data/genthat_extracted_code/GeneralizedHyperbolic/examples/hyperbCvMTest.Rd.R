library(GeneralizedHyperbolic)


### Name: hyperbCvMTest
### Title: Cramer-von~Mises Test of a Hyperbolic Distribution
### Aliases: hyperbCvMTest hyperbCvMTestPValue print.hyperbCvMTest
### Keywords: htest print

### ** Examples

param <- c(2, 2, 2, 1.5)
dataVector <- rhyperb(500, param = param)
fittedparam <- hyperbFit(dataVector)$param
hyperbCvMTest(dataVector, param = fittedparam)
dataVector <- rnorm(1000)
fittedparam <- hyperbFit(dataVector, startValues = "FN")$param
hyperbCvMTest(dataVector, param = fittedparam)



