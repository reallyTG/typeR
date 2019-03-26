library(diffeR)


### Name: overallSourcesPlot
### Title: Overall Sources plot
### Aliases: overallSourcesPlot
### Keywords: spatial

### ** Examples

comp <- raster(system.file("external/comparison.rst", package="diffeR"))
ref <- raster(system.file("external/reference.rst", package="diffeR"))
overallSourcesPlot(comp, ref)

ctmat <- crosstabm(comp, ref)
overallSourcesPlot(ctmatrix = ctmat, units = "pixels")



