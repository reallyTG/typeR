library(M3)


### Name: get.grid.info.M3
### Title: Get information about the grid used by the air quality model
### Aliases: get.grid.info.M3
### Keywords: IO

### ** Examples

## As mentioned in notes above, user will not typically call
## this function directly.

## Find the path to a demo file with lambert conic conformal projection.
lcc.file <- system.file("extdata/ozone_lcc.ncf", package="M3")
## Get a list containing information about the grid in this file.
grid.info <- get.grid.info.M3(lcc.file)


## Find the path to a demo file with polar stereographic projection.
polar.file <- system.file("extdata/surfinfo_polar.ncf", package="M3")
## Get a list containing information about the grid in this file.
grid.info <- get.grid.info.M3(polar.file)



