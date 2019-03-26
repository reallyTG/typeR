library(diffeR)


### Name: composite
### Title: create a composite matrix
### Aliases: composite
### Keywords: spatial

### ** Examples

comp <- raster(system.file("external/comparison.rst", package="diffeR"))
ref <- raster(system.file("external/reference.rst", package="diffeR"))
composite(comp, ref, factor=2)



