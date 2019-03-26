library(diffeR)


### Name: diffTablej
### Title: calculates difference metrics at the category level from a
###   square contingency table
### Aliases: diffTablej
### Keywords: spatial

### ** Examples

comp <- raster(system.file("external/comparison.rst", package="diffeR"))
ref <- raster(system.file("external/reference.rst", package="diffeR"))
ctmatCompRef <- crosstabm(comp, ref)
diffTablej(ctmatCompRef)

# Adjustment to population assumming a stratified random sampling
(population <- matrix(c(1,2,3,2000,4000,6000), ncol = 2))
ctmatCompRef <- crosstabm(comp, ref, percent = TRUE, population = population)
diffTablej(ctmatCompRef)



