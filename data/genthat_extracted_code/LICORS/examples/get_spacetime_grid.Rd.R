library(LICORS)


### Name: get_spacetime_grid
### Title: Get an iterator over the space-time coordinates of the field.
### Aliases: get_spacetime_grid

### ** Examples

AA <- matrix(rnorm(200), ncol = 10)
LC.geom <- setup_LC_geometry(speed = 1, horizon = list(PLC = 3, FLC = 0), shape = "cone")
bb <- get_spacetime_grid(dim(AA), LC.geom$coordinates)



