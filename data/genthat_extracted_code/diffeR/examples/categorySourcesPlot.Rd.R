library(diffeR)


### Name: categorySourcesPlot
### Title: Category Sources plot
### Aliases: categorySourcesPlot
### Keywords: spatial

### ** Examples

comp <- raster(system.file("external/comparison.rst", package="diffeR"))
ref <- raster(system.file("external/reference.rst", package="diffeR"))
categorySourcesPlot(comp, ref)

ctmat <- crosstabm(comp, ref)
categorySourcesPlot(ctmatrix = ctmat, units = "Pixels")



