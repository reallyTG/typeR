library(ncdf4.helpers)


### Name: nc.put.var.subset.by.axes
### Title: Puts a data subset in the place described by the named list of
###   axes
### Aliases: nc.put.var.subset.by.axes

### ** Examples

## Copy a subset of the data from one location to another.
## Not run: 
##D f <- nc_open("pr.nc")
##D dat <- nc.get.var.subset.by.axes(f1, "pr", list(X=1:4, Y=c(1, 3, 5)))
##D nc.put.var.subset.by.axes(f1, "pr", dat, list(X=5:8, Y=1:3))
##D nc_close(f)
## End(Not run)



