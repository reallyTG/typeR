library(MALDIquant)


### Name: smoothIntensity-methods
### Title: Smoothes intensities of a MassSpectrum object.
### Aliases: smoothIntensity smoothIntensity,MassSpectrum-method
###   smoothIntensity,list-method
### Keywords: methods

### ** Examples

## load package
library("MALDIquant")

## load example data
data("fiedler2009subset", package="MALDIquant")

## smooth spectra
s <- smoothIntensity(fiedler2009subset, method="MovingAverage",
                     halfWindowSize=2)
## or
s <- smoothIntensity(fiedler2009subset, method="MovingAverage",
                     halfWindowSize=2, weighted=TRUE)
## or
s <- smoothIntensity(fiedler2009subset, method="SavitzkyGolay",
                     halfWindowSize=10)



