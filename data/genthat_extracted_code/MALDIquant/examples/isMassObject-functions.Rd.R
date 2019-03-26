library(MALDIquant)


### Name: isMassSpectrum
### Title: Tests for MassSpectrum or MassPeaks object.
### Aliases: isMassSpectrum isMassPeaks
### Keywords: methods

### ** Examples

## load package
library("MALDIquant")

## create a MassPeaks object
peaks <- createMassPeaks(mass=1:100, intensity=1:100,
                         metaData=list(name="example 1"))

## test
isMassPeaks(peaks)      # returns TRUE
isMassSpectrum(peaks)   # returns FALSE
isMassPeaks(double())   # returns FALSE



