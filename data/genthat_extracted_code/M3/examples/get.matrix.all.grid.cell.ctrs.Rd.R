library(M3)


### Name: get.matrix.all.grid.cell.ctrs
### Title: Obtain a matrix giving the locations of the grid cell centers
### Aliases: get.matrix.all.grid.cell.ctrs

### ** Examples

## As mentioned in notes above, user will not typically call
## this function directly.

## Find the path to a demo file on lambert conic conformal projection.
lcc.file <- system.file("extdata/ozone_lcc.ncf", package="M3")
## Get a list of the x- and y-coordinates of the centers of all
## grid cells.
ctrs <- get.matrix.all.grid.cell.ctrs(lcc.file, units="km")



