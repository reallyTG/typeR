library(HelpersMG)


### Name: ind_long_lat
### Title: Return or the index in ncdf object from lat/longitude or inverse
### Aliases: ind_long_lat

### ** Examples

## Not run: 
##D url <- "ftp://ftp.cdc.noaa.gov/Datasets/noaa.oisst.v2.highres/"
##D url <- paste0(url, "sst.day.mean.2012.v2.nc")
##D dest <- paste(Sys.getenv("HOME"), "/sst.day.mean.2012.v2.nc", sep="")
##D download.file(url, dest)
##D library("ncdf4")
##D dta2012 <- nc_open(dest)
##D indices <- ind_long_lat(ncdf=dta2012, lat=5.89, long=-20.56)
##D coordinates <- ind_long_lat(ncdf=dta2012, indice.lat=20, indice.long=30)
##D # library("RNetCDF")
##D # dta2012 <- open.nc(dest)
##D # indices <- ind_long_lat(ncdf=dta2012, lat=5.89, long=-20.56)
##D # coordinates <- ind_long_lat(ncdf=dta2012, indice.lat=20, indice.long=30)
##D # ncdf library is depreciated in CRAN
##D # library("ncdf")
##D # dta2012 <- open.ncdf(dest)
##D # indices <- ind_long_lat(ncdf=dta2012, lat=5.89, long=-20.56)
##D # coordinates <- ind_long_lat(ncdf=dta2012, indice.lat=20, indice.long=30)
## End(Not run)



