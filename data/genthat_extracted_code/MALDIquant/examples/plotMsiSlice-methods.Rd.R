library(MALDIquant)


### Name: plotMsiSlice-methods
### Title: Plots a Mass Spectrometry Imaging dataset.
### Aliases: plotMsiSlice plotMsiSlice,list-method
###   plotMsiSlice,array-method plotMsiSlice,matrix-method
### Keywords: Graphics|hplot

### ** Examples

## load package
library("MALDIquant")

## load example data
data("fiedler2009subset", package="MALDIquant")

## please note: this is NOT a MSI data set
## we just add some coordinates for demonstration
coordinates(fiedler2009subset) <- cbind(x=rep(1:4, 2), y=rep(1:2, each=4))

plotMsiSlice(fiedler2009subset, center=8936.97, tolerance=0.25)

plotMsiSlice(fiedler2009subset, center=c(5864.49, 8936.97), tolerance=0.25,
             combine=TRUE,
             colRamp=list(colorRamp(c("#000000", "#FF00FF")),
                          colorRamp(c("#000000", "#00FF00"))))



