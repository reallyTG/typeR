library(MALDIquant)


### Name: plot-methods
### Title: Plots an AbstractMassObject object.
### Aliases: plot,AbstractMassObject,missing-method
###   plot,MassSpectrum,missing-method
### Keywords: methods Graphics|hplot

### ** Examples

## load package
library("MALDIquant")

## create a MassSpectrum object by default constructor
s <- createMassSpectrum(mass=1:100, intensity=rnorm(100)^2,
                        metaData=list(name="example"))

## show some details
s

## plot spectrum
plot(s)



