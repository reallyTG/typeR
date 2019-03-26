library(MALDIquant)


### Name: warpMassSpectra
### Title: Run warping functions on AbstractMassObject objects.
### Aliases: warpMassSpectra warpMassPeaks
### Keywords: methods

### ** Examples

## load package
library("MALDIquant")

## create a MassPeaks object
p <- createMassPeaks(mass=1:5, intensity=1:5)

## stupid warping function for demonstration
## (please use determineWarpingFunctions in real life applications)
simpleWarp <- function(x) { return(1) }

## run warping function
w <- warpMassPeaks(list(p), list(simpleWarp))[[1]]

## compare results
all(mass(w) == mass(p)+1) # TRUE

## no warping (MassPeaks object is not changed)
warpMassPeaks(list(p), list(NA))

## no warping (intensity values of MassPeaks object are set to zero)
warpMassPeaks(list(p), list(NA), emptyNoMatches=TRUE)



