library(ncdf4.helpers)


### Name: nc.get.coordinate.axes
### Title: Get a list of dimension variables and axes for a variable's
###   coordinate variable
### Aliases: nc.get.coordinate.axes

### ** Examples

## Get coordinate axes from file.
## Not run: 
##D f <- nc_open("pr.nc")
##D coord.axes <- nc.get.coordinate.axes(f, "pr")
##D nc_close(f)
## End(Not run)



