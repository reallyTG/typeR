library(trip)


### Name: rasterize
### Title: Rasterize trip objects based on line-segment attributes.
### Aliases: rasterize rasterize,trip,RasterLayer-method
###   rasterize,trip,missing-method

### ** Examples

example(trip)
tr$temp <- sort(runif(nrow(tr)))
r <- rasterize(tr)

rasterize(tr, grid = r)
rasterize(tr, r, field = "temp")
## Not run: 
##D rasterize(tr, method = "density")
##D rasterize(tr, method = "density", grid = r)
##D 
##D rasterize(tr, r, field = "tms")
##D rasterize(tr, r)
##D 
##D 
##D library(raster)
##D r2 <- aggregate(r, fact = 4)
##D rasterize(tr, grid = r2)
##D rasterize(tr, method = "density")
##D rasterize(tr, method = "density", grid = r2)
##D rasterize(tr, r2, field = "temp")
##D rasterize(tr, r2, field = "tms")
##D rasterize(tr, r2)
## End(Not run)




