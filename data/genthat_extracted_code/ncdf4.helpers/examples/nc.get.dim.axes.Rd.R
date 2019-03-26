library(ncdf4.helpers)


### Name: nc.get.dim.axes
### Title: Get dimension axes
### Aliases: nc.get.dim.axes

### ** Examples

## Get dimension axes from file.
## Not run: 
##D f <- nc_open("pr.nc")
##D ## Get dim axes for a specified variable
##D dim.axes <- nc.get.dim.axes(f, "pr")
##D ## Get all dim axes in file
##D dim.axes <- nc.get.dim.axes(f)
##D nc_close(f)
## End(Not run)



