library(rts)


### Name: period.apply
### Title: Apply a function over specified time intervals
### Aliases: period.apply period.apply,RasterStackTS-method
###   period.apply,RasterBrickTS-method
### Keywords: utilities

### ** Examples

## Not run: 
##D file <- system.file("external/ndvi", package="rts")
##D 
##D ndvi <- rts(file) # read the ndvi time series from the specified file
##D 
##D ndvi
##D 
##D ep <- endpoints(ndvi,'years') # extract the end index on each year period
##D 
##D ndvi.y <- period.apply(ndvi,ep,mean) # apply the mean function on each year
##D 
##D ndvi.y
##D 
##D #---------
##D ep <- endpoints(ndvi,'quarters') # extract the end index on each quarter of a year
##D 
##D # a function:
##D f <- function(x) {
##D   if (min(x) > 0.5) mean(x)
##D   else 0
##D }
##D 
##D ndvi.q <- period.apply(ndvi,ep,f) # apply the function f on each quarter
##D 
## End(Not run)




