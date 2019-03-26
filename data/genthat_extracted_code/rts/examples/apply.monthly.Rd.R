library(rts)


### Name: apply.monthly
### Title: Apply a function over calendar periods
### Aliases: apply.daily apply.weekly apply.monthly apply.quarterly
###   apply.yearly apply.daily,RasterStackBrickTS-method
###   apply.weekly,RasterStackBrickTS-method
###   apply.monthly,RasterStackBrickTS-method
###   apply.quarterly,RasterStackBrickTS-method
###   apply.yearly,RasterStackBrickTS-method

### ** Examples

## Not run: 
##D file <- system.file("external/ndvi", package="rts")
##D 
##D ndvi <- rts(file) # read the ndvi time series from the specified file
##D ndvi
##D ndvi.y <- apply.yearly(ndvi, mean) # apply mean function for each year
##D ndvi.y
##D ndvi.q <- apply.quarterly(ndvi,sd) # apply sd function for each quarter of years
##D ndvi.q 
## End(Not run)



