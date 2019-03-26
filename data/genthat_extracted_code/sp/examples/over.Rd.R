library(sp)


### Name: over-methods
### Title: consistent spatial overlay for points, grids and polygons
### Aliases: over %over% over-methods
###   over,SpatialPoints,SpatialPoints-method
###   over,SpatialPoints,SpatialPointsDataFrame-method
###   over,SpatialPoints,SpatialPolygons-method
###   over,SpatialPoints,SpatialPolygonsDataFrame-method
###   over,SpatialGridDataFrame,SpatialPolygonsDataFrame-method
###   over,SpatialPolygons,SpatialPoints-method
###   over,SpatialPolygons,SpatialPointsDataFrame-method
###   over,SpatialGridDataFrame,SpatialPoints-method
###   over,SpatialGrid,SpatialPoints-method
###   over,SpatialPixelsDataFrame,SpatialPoints-method
###   over,SpatialPixels,SpatialPoints-method
###   over,SpatialPoints,SpatialGrid-method
###   over,SpatialPoints,SpatialGridDataFrame-method
###   over,SpatialPoints,SpatialPixels-method
###   over,SpatialPoints,SpatialPixelsDataFrame-method
###   over,SpatialPolygons,SpatialGridDataFrame-method
###   over,SpatialGrid,SpatialPolygons-method
###   over,SpatialGrid,SpatialPolygonsDataFrame-method
###   over,SpatialPolygons,SpatialGrid-method
###   over,SpatialGrid,SpatialGrid-method
###   over,SpatialGrid,SpatialGridDataFrame-method
###   over,SpatialGrid,SpatialPixels-method
###   over,SpatialGrid,SpatialPixelsDataFrame-method
###   over,SpatialGrid,SpatialPointsDataFrame-method
###   over,Spatial,Spatial-method overDF_for_rgeos
### Keywords: methods

### ** Examples

r1 = cbind(c(180114, 180553, 181127, 181477, 181294, 181007, 180409, 
180162, 180114), c(332349, 332057, 332342, 333250, 333558, 333676, 
332618, 332413, 332349))
r2 = cbind(c(180042, 180545, 180553, 180314, 179955, 179142, 179437, 
179524, 179979, 180042), c(332373, 332026, 331426, 330889, 330683, 
331133, 331623, 332152, 332357, 332373))
r3 = cbind(c(179110, 179907, 180433, 180712, 180752, 180329, 179875, 
179668, 179572, 179269, 178879, 178600, 178544, 179046, 179110),
c(331086, 330620, 330494, 330265, 330075, 330233, 330336, 330004, 
329783, 329665, 329720, 329933, 330478, 331062, 331086))
r4 = cbind(c(180304, 180403,179632,179420,180304),
c(332791, 333204, 333635, 333058, 332791))

sr1=Polygons(list(Polygon(r1)),"r1")
sr2=Polygons(list(Polygon(r2)),"r2")
sr3=Polygons(list(Polygon(r3)),"r3")
sr4=Polygons(list(Polygon(r4)),"r4")
sr=SpatialPolygons(list(sr1,sr2,sr3,sr4))
srdf=SpatialPolygonsDataFrame(sr, data.frame(cbind(1:4,5:2), 
	row.names=c("r1","r2","r3","r4")))

data(meuse)
coordinates(meuse) = ~x+y

plot(meuse)
polygon(r1)
polygon(r2)
polygon(r3)
polygon(r4)
# retrieve mean heavy metal concentrations per polygon:
over(sr, meuse[,1:4], fn = mean)

# return the number of points in each polygon:
sapply(over(sr, geometry(meuse), returnList = TRUE), length)

data(meuse.grid)
coordinates(meuse.grid) = ~x+y
gridded(meuse.grid) = TRUE

over(sr, geometry(meuse))
over(sr, meuse)
over(sr, geometry(meuse), returnList = TRUE)
over(sr, meuse, returnList = TRUE)

over(meuse, sr)
over(meuse, srdf)

# same thing, with grid:
over(sr, meuse.grid)
over(sr, meuse.grid, fn = mean)
over(sr, meuse.grid, returnList = TRUE)

over(meuse.grid, sr)
over(meuse.grid, srdf, fn = mean)
over(as(meuse.grid, "SpatialPoints"), sr)
over(as(meuse.grid, "SpatialPoints"), srdf)



