library(rts)


### Name: plot
### Title: Plot raster time series
### Aliases: plot plot,RasterStackBrickTS-method plot,rts-method
###   plot,RasterStackBrickTS,ANY-method plot,rts,ANY-method
### Keywords: methods spatial

### ** Examples

## Not run: 
##D file <- system.file("external/ndvi", package="rts")
##D 
##D ndvi <- rts(file) # read the ndvi time series from the specified file
##D 
##D plot(ndvi,1:4) # plot the first 4 layers in the raster time series
##D 
##D plot(ndvi,"/20010101")
##D 
##D plot(ndvi,"20010101/20010501")
##D 
##D plot(ndvi,"2001-02-01/2001-05-01")
##D 
##D plot(ndvi,"2001-02-01")
##D 
##D 
##D n1 <- extract(ndvi,125)# extract the time series values at cell number 125 for all times
##D 
##D 
##D plot(n1)
##D 
##D n2 <- extract(ndvi,125,"/20090101") # extract the time series values at cell number 125
##D # for all times after 2009-01-01
##D 
##D n2
##D 
##D plot(n2)
##D 
##D 
##D n3 <- extract(ndvi,125:127,"200901/") # extract the time series values at the specified cell
##D # numbers for all times before 2009-01
##D 
##D n3
##D 
##D plot(n3) # plot the time-series values for the first series in n3 (i.e cell: 125)
##D 
##D plot(n3,y=1:3) # plot for the 3 series in n3 (i.e cells of 125:127)
##D 
##D plot(n3,y=1:3,col=1)
##D 
##D plot(n3,y=1:3,col=c(1,4,5))
##D 
##D plot(n3,y='all')
## End(Not run)




