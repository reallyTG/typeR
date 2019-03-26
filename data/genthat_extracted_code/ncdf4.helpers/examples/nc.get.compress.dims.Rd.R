library(ncdf4.helpers)


### Name: nc.get.compress.dims
### Title: Get X and Y dimension variables for reduced (compressed) grids
### Aliases: nc.get.compress.dims

### ** Examples

## Get compress dimensions from file.
## Not run: 
##D f <- nc_open("pr.nc")
##D compress.dims <- nc.get.compress.dims(f, "pr")
##D nc_close(f)
## End(Not run)



