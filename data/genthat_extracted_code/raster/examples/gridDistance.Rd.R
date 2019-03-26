library(raster)


### Name: gridDistance
### Title: Distance on a grid
### Aliases: gridDistance gridDistance,RasterLayer-method
### Keywords: spatial

### ** Examples


#world lon/lat raster
r <- raster(ncol=10,nrow=10)
r[] <- 1
r[48] <- 2
r[66:68] <- 3
d <- gridDistance(r,origin=2,omit=3) 
plot(d)

#UTM small area
projection(r) <- "+proj=utm +zone=15 +ellps=GRS80 +datum=NAD83 +units=m +no_defs"
d <- gridDistance(r,origin=2,omit=3) 
plot(d)




