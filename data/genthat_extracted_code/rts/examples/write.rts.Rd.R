library(rts)


### Name: write.rts
### Title: Write raster time Series data to a file
### Aliases: write.rts write.rts,RasterStackBrickTS,character-method
### Keywords: write, write raster time series

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
##D d <- c("2000-02-01","2000-03-01","2000-04-01","2000-05-01") # corresponding dates to 4 rasters
##D d <- as.Date(d) # or d <- as.POSIXct(d) 
##D 
##D n <- rts(r,as.Date(d)) # creating a RasterStackTS object
##D 
##D write.rts(n,"nf") # writing n into the working directory
##D 
##D rt <- read.rts("nf") # reading nf from the working directory
##D 
##D rt
##D 
## End(Not run)




