library(rWind)


### Name: wind.dl_2
### Title: Wind-data download
### Aliases: wind.dl_2 [[.rWind_series
### Keywords: ~gfs ~wind

### ** Examples


# Download wind for Iberian Peninsula region at 2015, February 12, 00:00
## Not run: 
##D 
##D wind.dl_2("2018/3/15 9:00:00",-10,5,35,45)
##D 
##D library(lubridate)
##D dt <- seq(ymd_hms(paste(2018,1,1,00,00,00, sep="-")),
##D           ymd_hms(paste(2018,1,2,21,00,00, sep="-")),by="3 hours")
##D ww <- wind.dl_2(dt,-10,5,35,45)
##D tidy (ww)
##D 
## End(Not run)




