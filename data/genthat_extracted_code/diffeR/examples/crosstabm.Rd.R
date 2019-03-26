library(diffeR)


### Name: crosstabm
### Title: create a contingency table between a comparison raster map
###   (rows) and a reference raster map (columns)
### Aliases: crosstabm
### Keywords: spatial

### ** Examples

comp <- raster(system.file("external/comparison.rst", package="diffeR"))
ref <- raster(system.file("external/reference.rst", package="diffeR"))
crosstabm(comp, ref)

# Population-adjusted square contingency table
(population <- matrix(c(1,2,3,2000,4000,6000), ncol=2))
crosstabm(comp, ref, population = population)

# Population-adjusted square contingency table, output as percentage
crosstabm(comp, ref, percent=TRUE, population = population)



