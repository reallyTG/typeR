library(beadarrayMSV)


### Name: scatterArrays
### Title: Cartesian scatter-plots of two-colour intensities
### Aliases: scatterArrays

### ** Examples

## Not run: 
##D #Read a BeadSetIllumina object using files in example data directory
##D rPath <- system.file("extdata", package="beadarrayMSV")
##D BSDataRaw <- readBeadSummaryOutput(path=rPath,recursive=TRUE)
##D 
##D ## Plot G vs. R
##D dev.new()
##D scatterArrays(BSDataRaw,smooth=FALSE)
## End(Not run)



