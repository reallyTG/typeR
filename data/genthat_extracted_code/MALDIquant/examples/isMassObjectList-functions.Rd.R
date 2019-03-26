library(MALDIquant)


### Name: isMassSpectrumList
### Title: Tests a list of MassSpectrum or MassPeaks objects.
### Aliases: isMassSpectrumList isMassPeaksList
### Keywords: methods

### ** Examples

## load package
library("MALDIquant")

## create list
p <- list()

## test list
isMassPeaksList(p) # returns FALSE

## create two MassPeaks objects and add them to the list
p <- createMassPeaks(mass=1:100, intensity=1:100,
                     metaData=list(name="example 1"))
p <- createMassPeaks(mass=1:100, intensity=1:100,
                     metaData=list(name="example 2"))

## test list
isMassPeaksList(p)    # returns TRUE
isMassSpectrumList(p) # returns FALSE



