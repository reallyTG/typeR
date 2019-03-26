library(dynatopmodel)


### Name: build_chans
### Title: Construct a raster of channel locations from vector or
###   topographic data
### Aliases: build_chans

### ** Examples

## Not run: 
##D 
##D require(dynatopmodel)
##D data("brompton")
##D 
##D chan.rast <- build_chans(dem=brompton$dem, drn=brompton$drn, buff=5, chan.width=2)
##D # show it
##D sp::plot(chan.rast[[1]], col="green", legend=FALSE)
## End(Not run)



