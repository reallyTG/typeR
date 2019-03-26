library(LICORS)


### Name: compute_margin_coordinates
### Title: Get LC configuration from a (N+1)D field
### Aliases: compute_margin_coordinates
### Keywords: manip

### ** Examples

LC_geom <- setup_LC_geometry(speed = 1, horizon = list(PLC = 3, FLC = 0), shape = "cone")

data(contCA00)

aa <- compute_margin_coordinates(dim(contCA00$observed), LC_geom$coordinates)
aa



