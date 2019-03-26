library(quantspec)


### Name: getValues-QuantilePG
### Title: Get values from a quantile periodogram.
### Aliases: getValues,QuantilePG-method getValues-QuantilePG
### Keywords: Access-functions

### ** Examples

Y        <- rnorm(32)
freq     <- 2*pi*c(0:31)/32
levels   <- c(0.25,0.5,0.75)
qPG      <- quantilePG(Y, levels.1=levels)
V.all    <- getValues(qPG)
V.coarse <- getValues(qPG, frequencies = 2*pi*c(0:15)/16)
V.fine   <- getValues(qPG, frequencies = 2*pi*c(0:63)/64)
V.part   <- getValues(qPG, frequencies = 2*pi*c(0:16)/32,
                           levels.1 = c(0.25), levels.2 = c(0.5,0.75))



