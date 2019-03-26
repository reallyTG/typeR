library(M3)


### Name: get.coord.for.dimension
### Title: Get the grid coordinates for the grid rows or columns.
### Aliases: get.coord.for.dimension

### ** Examples

## As mentioned in notes above, user will not typically call
## this function directly.

## Find the path to a demo file with lambert conic conformal projection.
lcc.file <- system.file("extdata/ozone_lcc.ncf", package="M3")

## Get a list of the x-coordinates of the centers of the cells.
x.ctrs <- get.coord.for.dimension(lcc.file, dimension="col", units="km")



