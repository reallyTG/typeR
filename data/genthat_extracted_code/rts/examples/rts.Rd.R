library(rts)


### Name: rts
### Title: Create a Raster Time Series object
### Aliases: rts rts,RasterStack,ANY-method rts,RasterBrick,ANY-method
###   rts,character,ANY-method rts,xts,ANY-method
###   rts,character,missing-method
### Keywords: raster, time series

### ** Examples


## Not run: 
##D path <- system.file("external", package="rts") # location of files
##D 
##D lst <- list.files(path=path,pattern='.asc$',full.names=TRUE)
##D lst # list of raster files
##D 
##D 
##D r <- stack(lst) # creating a RasterStack object
##D 
##D r
##D 
##D d <- c("2000-02-01","2000-03-01","2000-04-01","2000-05-01") # corresponding dates to 4 rasters
##D d <- as.Date(d) # or d <- as.POSIXct(d) 
##D 
##D rt <- rts(r,d) # creating a RasterStackTS object
##D 
##D rt
##D 
##D plot(rt)
## End(Not run)






