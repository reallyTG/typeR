library(quantspec)


### Name: SmoothedPG-constructor
### Title: Create an instance of the 'SmoothedPG' class.
### Aliases: SmoothedPG-constructor smoothedPG
### Keywords: Constructors

### ** Examples

Y <- rnorm(64)
levels.1 <- c(0.25,0.5,0.75)
weight <- kernelWeight(W=W0)

# Version 1a of the constructor -- for numerics:
sPG.ft <- smoothedPG(Y, levels.1 = levels.1, weight = weight, type="clipped")
sPG.qr <- smoothedPG(Y, levels.1 = levels.1, weight = weight, type="qr")

# Version 1b of the constructor -- for ts objects:
sPG.ft <- smoothedPG(wheatprices, levels.1 = c(0.05,0.5,0.95), weight = weight)

# Version 1c of the constructor -- for zoo objects:
sPG.ft <- smoothedPG(sp500, levels.1 = c(0.05,0.5,0.95), weight = weight)

# Version 2 of the constructor:
qPG.ft <- quantilePG(Y, levels.1 = levels.1, type="clipped")
sPG.ft <- smoothedPG(qPG.ft, weight = weight)
qPG.qr <- quantilePG(Y, levels.1 = levels.1, type="qr")
sPG.qr <- smoothedPG(qPG.qr, weight = weight)



