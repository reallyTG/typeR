library(getCRUCLdata)


### Name: get_CRU_df
### Title: Download and Create a Tidy Data Frame of CRU CL v. 2.0
###   Climatology Variables
### Aliases: get_CRU_df

### ** Examples

## Not run: 
##D # Download data and create a data frame of precipitation and temperature
##D # without caching the data files
##D CRU_pre_tmp <- get_CRU_df(pre = TRUE, tmp = TRUE)
##D 
##D # Download temperature and calculate tmin and tmax, save the temperature file
##D # for later use by caching
##D 
##D CRU_tmp <- get_CRU_df(tmp = TRUE, tmn = TRUE, tmx = TRUE, cache = TRUE)
## End(Not run)




