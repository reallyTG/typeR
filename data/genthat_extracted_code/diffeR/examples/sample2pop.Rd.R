library(diffeR)


### Name: sample2pop
### Title: corrects sample counts to population counts in a square
###   contingency table
### Aliases: sample2pop
### Keywords: spatial

### ** Examples

comp <- raster(system.file("external/comparison.rst", package="diffeR"))
ref <- raster(system.file("external/reference.rst", package="diffeR"))

# Sample square contingency table
(ctmatCompRef <- crosstabm(comp, ref))

# Population-adjusted square contingency table
(population <- matrix(c(1,2,3,2000,4000,6000), ncol=2))
sample2pop(ctmatCompRef, population = population)

# The square contingency table can also be adjusted directly using the crosstabm function
crosstabm(comp, ref, population = population)



