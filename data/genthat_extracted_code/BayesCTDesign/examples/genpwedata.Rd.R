library(BayesCTDesign)


### Name: genpwedata
### Title: Generating function for Piece-wise Exponential Data.
### Aliases: genpwedata

### ** Examples

nvalHC <- 60
time.vec <- c(0.3,0.9,1.5,2.1,2.4)
lambdaHC.vec <- c(0.19,0.35,0.56,0.47,0.38,0.34)
censor.value <- 3

SampleHistData <- genpwedata(nvalHC, lambdaHC.vec, 1.0, time.vec, censor.value)
SampleHistData



