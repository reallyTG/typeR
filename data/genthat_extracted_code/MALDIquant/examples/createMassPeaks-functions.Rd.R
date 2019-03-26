library(MALDIquant)


### Name: createMassPeaks
### Title: Creates a MassPeaks object.
### Aliases: createMassPeaks
### Keywords: methods

### ** Examples

## load package
library("MALDIquant")

## create a MassPeaks object by default constructor
s <- createMassPeaks(mass=1:100, intensity=rnorm(100)^2,
                     metaData=list(name="example peaks"))

## show some details
s



