library(rts)


### Name: VHPdownload
### Title: Download AVHRR-based Vegetation and Drought satellite image
###   products
### Aliases: VHPdownload VHPdownload,character-method
### Keywords: utilities

### ** Examples

## Not run: 
##D library(raster)
##D 
##D library(RCurl)
##D 
##D 
##D # download Vegetation Health Index for two months
##D vhi <- VHPdownload(x='VHI',dates=c('2015.01.01','2015.02.28'),rts=TRUE) # output is as rts object
##D 
##D vhi
##D 
##D plot(vhi[[1]])
##D 
##D plot(vhi[2120000]) # plot time series at the specified cell number
##D 
##D 
##D # to make sure the dates are appropriately specified, use a Date object:
##D 
##D dates <- as.Date(c('2015.01.01','2016.12.31'),format="##D 
##D 
##D dates
##D 
##D class(dates)
##D 
##D dates <- as.Date(c('2012-01-01','2012-12-31'),format="##D 
##D 
##D dates
##D  
##D # If your machine has multiple cores, you can use parallel downloading to speed up the downloads
##D # Vegetation Condition Index for two years
##D vci <- VHPdownload(x='VCI',dates=dates,rts=TRUE,ncore=4)
##D 
##D vci
##D 
##D plot(vci[[1:2]])
##D 
##D 
##D 
## End(Not run)




