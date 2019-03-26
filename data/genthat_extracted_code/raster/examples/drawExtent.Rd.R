library(raster)


### Name: drawExtent
### Title: Create an Extent object by drawing on a map
### Aliases: drawExtent
### Keywords: spatial

### ** Examples

## Not run: 
##D r1 <- raster(nrow=10, ncol=10)
##D r1[] <- runif(ncell(r1))
##D plot(r1)
##D # after running the following line, click on the map twice
##D e <- drawExtent()
##D # after running the following line, click on the map twice
##D mean(values(crop(r1, drawExtent())))
## End(Not run)



