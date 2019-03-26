library(ncdf4.helpers)


### Name: nc.copy.atts
### Title: Copy attributes from one variable in one file to another file
### Aliases: nc.copy.atts

### ** Examples

## Copy attributes from one variable to another; but don't copy units or
## standard_name, and copy long_name as old_long_name.
## Not run: 
##D f1 <- nc_open("pr.nc")
##D f2 <- nc_open("pr2.nc")
##D nc.copy.atts(f1, "pr", f2, "pr", c("units", "standard_name"),
##D              c(long_name="old_long_name"))
##D dim.axes <- nc.get.dim.axes.from.names(f, "pr")
##D nc_close(f1)
##D nc_close(f2)
## End(Not run)



