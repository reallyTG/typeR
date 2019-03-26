library(raster)


### Name: bind
### Title: Bind Spatial* objects
### Aliases: bind bind,SpatialPolygons,SpatialPolygons-method
###   bind,SpatialLines,SpatialLines-method
###   bind,SpatialPoints,SpatialPoints-method bind,matrix,matrix-method
###   bind,matrix,missing-method bind,data.frame,data.frame-method
###   bind,data.frame,missing-method bind,list,missing-method
### Keywords: methods spatial

### ** Examples

p <- readRDS(system.file("external/lux.rds", package="raster"))
mersch <- p[p$NAME_2=='Mersch', ]
diekirch <- p[p$NAME_2=='Diekirch', ]
remich <- p[p$NAME_2=='Remich', ]
remich$NAME_1 <- NULL
x <- bind(mersch, diekirch, remich)
plot(x)
data.frame(x)



