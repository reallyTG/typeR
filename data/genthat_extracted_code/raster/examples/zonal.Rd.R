library(raster)


### Name: zonal
### Title: Zonal statistics
### Aliases: zonal zonal,RasterLayer,RasterLayer-method
###   zonal,RasterStackBrick,RasterLayer-method
### Keywords: spatial

### ** Examples

r <- raster(ncols=10, nrows=10)
r[] <- runif(ncell(r)) * 1:ncell(r)
z <- r
z[] <- rep(1:5, each=20)
# for big files, use a character value rather than a function
zonal(r, z, 'sum')

# for smaller files you can also provide a function
## Not run: 
##D zonal(r, z, mean)
##D zonal(r, z, min)
## End(Not run)

# multiple layers
zonal(stack(r, r*10), z, 'sum')



