library(NormalLaplace)


### Name: nlFitStart
### Title: Find Starting Values for Fitting a Normal Laplace Distribution
### Aliases: nlFitStart nlFitStartMoM
### Keywords: distribution

### ** Examples

param <- c(2, 2, 1, 1)
dataVector <- rnl(500, param = param)
nlFitStart(dataVector, startValues = "MoM")



