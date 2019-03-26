library(diffeR)


### Name: overallComponentsPlot
### Title: Overall Components plot
### Aliases: overallComponentsPlot
### Keywords: spatial

### ** Examples

comp <- raster(system.file("external/comparison.rst", package="diffeR"))
ref <- raster(system.file("external/reference.rst", package="diffeR"))
overallComponentsPlot(comp, ref)

ctmat <- crosstabm(comp, ref)
overallComponentsPlot(ctmatrix = ctmat, units = "pixels")



