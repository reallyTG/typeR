library(MALDIquant)


### Name: determineWarpingFunctions
### Title: Determine warping functions of MassPeaks objects.
### Aliases: determineWarpingFunctions
### Keywords: methods

### ** Examples

## load package
library("MALDIquant")

## create a reference MassPeaks object
r <- createMassPeaks(mass=1:5, intensity=1:5)

## create test samples
p <- list(createMassPeaks(mass=((1:5)*1.01), intensity=1:5),
          createMassPeaks(mass=((1:5)*0.99), intensity=1:5))

## create an interactive device with 2 rows
par(mfrow=c(2, 1))
## calculate warping function
## (using a linear function as basic warping function)
## and show warping plot
w <- determineWarpingFunctions(p, tolerance=0.02, method="linear",
                               plot=TRUE, plotInteractive=TRUE)
par(mfrow=c(1, 1))

## w contains the individual warping functions
warpedPeaks <- warpMassPeaks(p, w)

## compare results
all(mass(r) == mass(warpedPeaks[[1]])) # TRUE
all(mass(r) == mass(warpedPeaks[[2]])) # TRUE



## realistic example

## load example data
data("fiedler2009subset", package="MALDIquant")

## running typical workflow

## use only four spectra of the subset
spectra <- fiedler2009subset[1:4]

## transform intensities
spectra <- transformIntensity(spectra, method="sqrt")

## smooth spectra
spectra <- smoothIntensity(spectra, method="MovingAverage")

## baseline correction
spectra <- removeBaseline(spectra)

## detect peaks
peaks <- detectPeaks(spectra)

## create an interactive device with 2 rows
par(mfrow=c(4, 1))
## calculate warping functions (using LOWESS based basic function [default])
w <- determineWarpingFunctions(peaks, plot=TRUE, plotInteractive=TRUE)
par(mfrow=c(1, 1))



## realistic example with user defined reference/calibration peaks

## use the workflow above for fiedler2009subset

## create reference peaks
refPeaks <- createMassPeaks(mass=c(1207, 1264, 1351, 1466, 1616, 2769, 2932,
                                   3191, 3262, 4091, 4209, 5904, 7762, 9285),
                            intensity=rep(1, 14))

## create an interactive device with 2 rows
par(mfrow=c(4, 1))
## calculate warping functions (using a quadratic function as basic function)
w <- determineWarpingFunctions(peaks, reference=refPeaks, method="quadratic",
                               plot=TRUE, plotInteractive=TRUE)
par(mfrow=c(1, 1))



