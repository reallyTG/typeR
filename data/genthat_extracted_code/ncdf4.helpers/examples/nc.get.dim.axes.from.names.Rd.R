library(ncdf4.helpers)


### Name: nc.get.dim.axes.from.names
### Title: Infer dimension axes from names of dimensions
### Aliases: nc.get.dim.axes.from.names

### ** Examples

## Get dimension axes from file by inferring them from dimension names
## Not run: 
##D f <- nc_open("pr.nc")
##D dim.axes <- nc.get.dim.axes.from.names(f, "pr")
##D nc_close(f)
## End(Not run)



