library(prism)


### Name: get_prism_dailys
### Title: Download daily prism data
### Aliases: get_prism_dailys

### ** Examples

## Not run: 
##D # Valid calls:
##D get_prism_dailys(type="tmean", minDate = "2013-06-01", maxDate = "2013-06-14", keepZip=FALSE)
##D get_prism_dailys(type="ppt", dates = "2013/06/01", keepZip=FALSE)
##D get_prism_dailys(
##D   type="tmean", 
##D   dates = as.Date("2013-06-01", "2013-06-14", "2014-06-30"), 
##D   keepZip=FALSE
##D )
##D 
##D # will fail:
##D get_prism_dailys(type="ppt", minDate = "2013-06-01", dates = "2013-06-14", keepZip=FALSE)
##D get_prism_dailys(type="ppt", minDate = "2013-06-01", keepZip=FALSE)
## End(Not run)



