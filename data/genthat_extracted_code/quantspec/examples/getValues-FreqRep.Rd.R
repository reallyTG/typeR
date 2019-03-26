library(quantspec)


### Name: getValues-FreqRep
### Title: Get values from a frequency representation.
### Aliases: getValues,FreqRep-method getValues-FreqRep
### Keywords: Access-functions

### ** Examples

Y        <- rnorm(32)
freq     <- 2*pi*c(0:31)/32
levels   <- c(0.25,0.5,0.75)
cFT      <- clippedFT(Y, freq, levels)
V.all    <- getValues(cFT)
V.coarse <- getValues(cFT, frequencies = 2*pi*c(0:15)/16, levels = levels)
V.fine   <- getValues(cFT, frequencies = 2*pi*c(0:63)/64, levels = levels)
V.part   <- getValues(cFT, frequencies = 2*pi*c(0:16)/32, levels = c(0.25))



