library(MALDIquant)


### Name: calibrateIntensity-methods
### Title: Calibrates intensities of a MassSpectrum object.
### Aliases: calibrateIntensity calibrateIntensity,MassSpectrum-method
###   calibrateIntensity,list-method
### Keywords: methods

### ** Examples

## load package
library("MALDIquant")

## load example data
data("fiedler2009subset", package="MALDIquant")

## baseline correction
b <- removeBaseline(fiedler2009subset)

## calibrate intensity values
calibrateIntensity(b, method="TIC")

## calibrate intensity values using TIC for a specific mass range
calibrateIntensity(b, method="TIC", range=c(3000, 5000))



