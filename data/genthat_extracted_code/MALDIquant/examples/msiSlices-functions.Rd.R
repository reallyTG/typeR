library(MALDIquant)


### Name: msiSlices
### Title: Turn a list of AbstractMassObjects into a mass spectrometry
###   imaging slice.
### Aliases: msiSlices

### ** Examples

## load package
library("MALDIquant")

## load example data
data("fiedler2009subset", package="MALDIquant")

## please note: this is NOT a MSI data set
## we just add some coordinates for demonstration
coordinates(fiedler2009subset) <- cbind(x=rep(1:4, 2), y=rep(1:2, each=4))

slices <- msiSlices(fiedler2009subset, center=c(5864.49, 8936.97),
                    tolerance=0.25)

slices



