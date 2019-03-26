library(rnoaa)


### Name: ersst
### Title: NOAA Extended Reconstructed Sea Surface Temperature (ERSST) data
### Aliases: ersst

### ** Examples

## Not run: 
##D # October, 2015
##D ersst(year = 2015, month = 10)
##D 
##D # May, 2015
##D ersst(year = 2015, month = 5)
##D ersst(year = 2015, month = "05")
##D 
##D # February, 1890
##D ersst(year = 1890, month = 2)
##D 
##D # Process data
##D library("ncdf4")
##D res <- ersst(year = 1890, month = 2)
##D ## varibles
##D names(res$var)
##D ## get a variable
##D ncdf4::ncvar_get(res, "ssta")
## End(Not run)



