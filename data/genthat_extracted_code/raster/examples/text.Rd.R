library(raster)


### Name: text
### Title: Add labels to a map
### Aliases: text text,RasterLayer-method text,RasterStackBrick-method
###   text,SpatialPoints-method text,SpatialPolygons-method
### Keywords: methods spatial

### ** Examples
 
r <- raster(nrows=4, ncols=4)
r <- setValues(r, 1:ncell(r))
plot(r)
text(r)

plot(r)
text(r, halo=TRUE, hc='blue', col='white', hw=0.2)

plot(r, col=bpy.colors(5))
text(r, fun=function(x){x<5 | x>12}, col=c('red', 'white'), vfont=c("sans serif", "bold"), cex=2)



