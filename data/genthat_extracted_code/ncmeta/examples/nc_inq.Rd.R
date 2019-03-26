library(ncmeta)


### Name: nc_inq
### Title: File info
### Aliases: nc_inq nc_inq.NetCDF nc_inq.character

### ** Examples

## No test: 
## Not run: 
##D  f <- raadfiles:::cmip5_files()$fullname[1]
##D  nc_inq(f)
##D  nc_var(f, 0)
##D  nc_dim(f, 0)
##D  
## End(Not run)
## End(No test)
f <- system.file("extdata", "S2008001.L3m_DAY_CHL_chlor_a_9km.nc", package = "ncmeta")
nc_inq(f)
nc_var(f, 0)
nc_dim(f, 0)

nc_vars(f)
nc_dims(f)
## No test: 
## Not run: 
##D ## thredds (see rerddap)
##D u <- "https://upwell.pfeg.noaa.gov/erddap/tabledap/FRDCPSTrawlLHHaulCatch"
##D nc_inq(u)
##D # A tibble: 1 x 5
##D #ndims nvars ngatts unlimdimid
##D #<dbl> <dbl>  <dbl>      <lgl>
##D #  1     2    18     37         NA
##D # ... with 1 more variables: filename <chr>
## End(Not run)## End(No test)



