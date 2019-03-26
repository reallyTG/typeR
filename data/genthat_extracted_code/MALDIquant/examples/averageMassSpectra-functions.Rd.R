library(MALDIquant)


### Name: averageMassSpectra
### Title: Averages 'MassSpectrum' objects.
### Aliases: averageMassSpectra
### Keywords: methods

### ** Examples

## load package
library("MALDIquant")

## create four MassSpectrum objects and add them to a list
s <- list(createMassSpectrum(mass=1:5, intensity=1:5),
          createMassSpectrum(mass=1:5, intensity=1:5),
          createMassSpectrum(mass=1:5, intensity=6:10),
          createMassSpectrum(mass=1:5, intensity=6:10))

## average all four MassSpectrum objects into a single new one
## by sum their intensities
## (no labels, returns only one new MassSpectrum object)
summedSpectra <- averageMassSpectra(s, method="sum")

## only average MassSpectrum objects in a group
## (e.g. useful for technical replicates)
## (two different labels, returns a list of two new MassPeaks objects)
groups <- factor(c("a", "a", "b", "b"), levels=c("a", "b"))
averagedSpectra <- averageMassSpectra(s, labels=groups, method="mean")



