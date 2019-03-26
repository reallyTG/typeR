library(OPI)


### Name: opiClose
### Title: Close using OPI.
### Aliases: opiClose
### Keywords: misc

### ** Examples

chooseOpi("SimGaussian")
if (!is.null(opiInitialize(sd=2)))
    stop("opiInitialize failed")
if (!is.null(opiClose()))
    stop("opiClose failed, which is very surprising!")



