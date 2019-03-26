library(ncdf4.helpers)


### Name: nc.get.var.subset.by.axes
### Title: Gets a data subset in the place described by the named list of
###   axes
### Aliases: nc.get.var.subset.by.axes

### ** Examples

## Get a subset of the data.
## Not run: 
##D f <- nc_open("pr.nc")
##D dat <- nc.get.var.subset.by.axes(f1, "pr", list(X=1:4, Y=c(1, 3, 5)))
##D nc_close(f)
## End(Not run)



