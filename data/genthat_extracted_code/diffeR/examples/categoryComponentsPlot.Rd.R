library(diffeR)


### Name: categoryComponentsPlot
### Title: Category Components plot
### Aliases: categoryComponentsPlot
### Keywords: spatial

### ** Examples

comp <- raster(system.file("external/comparison.rst", package="diffeR"))
ref <- raster(system.file("external/reference.rst", package="diffeR"))
categoryComponentsPlot(comp, ref)

ctmat <- crosstabm(comp, ref)
categoryComponentsPlot(ctmatrix = ctmat, units = "pixels")



