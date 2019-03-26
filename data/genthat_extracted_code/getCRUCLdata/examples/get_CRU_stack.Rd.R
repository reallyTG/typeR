library(getCRUCLdata)


### Name: get_CRU_stack
### Title: Download and Create a List of Raster Stack Objects From CRU CL
###   v. 2.0 Climatology Variables
### Aliases: get_CRU_stack

### ** Examples

## Not run: 
##D # Download data and create a raster stack of precipitation and temperature
##D # without caching the data files
##D CRU_pre_tmp <- get_CRU_stack(pre = TRUE, tmp = TRUE)
##D 
##D # Download temperature and calculate tmin and tmax, save the data files for
##D # later use by caching them locally
##D 
##D CRU_tmp <- get_CRU_stack(tmp = TRUE, tmn = TRUE, tmx = TRUE, cache = TRUE)
## End(Not run)



