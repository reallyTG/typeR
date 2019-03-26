library(MALDIquant)


### Name: createMassSpectrum
### Title: Creates a MassSpectrum object.
### Aliases: createMassSpectrum
### Keywords: methods

### ** Examples

## load package
library("MALDIquant")

## create a MassSpectrum object by default constructor
s <- createMassSpectrum(mass=1:100, intensity=rnorm(100)^2,
                        metaData=list(name="example spectrum"))

## show some details
s



