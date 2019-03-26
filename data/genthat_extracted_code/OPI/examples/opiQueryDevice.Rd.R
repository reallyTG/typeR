library(OPI)


### Name: opiQueryDevice
### Title: Query device using OPI.
### Aliases: opiQueryDevice
### Keywords: misc

### ** Examples

chooseOpi("SimGaussian")
if (!is.null(opiInitialize(sd=2)))
    stop("opiInitialize failed")
print(opiQueryDevice())



