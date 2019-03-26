library(ncdf4.helpers)


### Name: nc.conform.data
### Title: Conform data to dimension order and structure of output
### Aliases: nc.conform.data

### ** Examples

## Get data from one file and conform it to the dimension order of another.
## Not run: 
##D f1 <- nc_open("pr.nc")
##D f2 <- nc_open("pr2.nc", write=TRUE)
##D dat <- nc.get.var.subset.by.axes(f1, "pr")
##D new.dat <- nc.conform.data(f2, f1, "pr", "pr", dat)
##D nc_close(f1)
##D nc_close(f2)
## End(Not run)



