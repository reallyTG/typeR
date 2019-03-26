library(MALDIquant)


### Name: intensityMatrix
### Title: Converts a list of MassPeaks objects into a matrix.
### Aliases: intensityMatrix
### Keywords: methods

### ** Examples

## load package
library("MALDIquant")

## create example MassPeaks objects
p <- list(createMassPeaks(mass=1:4,
                          intensity=11:14,
                          metaData=list(name="test mass peaks 1")),
          createMassPeaks(mass=2:5,
                          intensity=22:25,
                          metaData=list(name="test mass peaks 2")))

## converts MassPeaks objects into a matrix
intensityMatrix(p)


## realistic example

## load example data
data("fiedler2009subset", package="MALDIquant")

## transform intensities
s <- transformIntensity(fiedler2009subset, method="sqrt")

## smoothing spectrum
s <- smoothIntensity(s, method="MovingAverage")

## remove baseline
s <- removeBaseline(s)

## call peak detection
p <- detectPeaks(s)

## bin peaks
p <- binPeaks(p)

## convert MassPeaks objects into a matrix with missing intensity
## values
intensityMatrix(p)

## convert MassPeaks and MassSpectrum objects into a matrix without
## missing intensity values
intensityMatrix(p, s)



