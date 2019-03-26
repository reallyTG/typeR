library(sensors4plumes)


### Name: SpatialPolygridDataFrame-class
### Title: Class "SpatialPolygridDataFrame"
### Aliases: SpatialPolygridDataFrame SpatialPolygridDataFrame-class
###   SpatialPolygridDataFrame-method 'coerce,SpatialGridDataFrame,
###   SpatialPolygridDataFrame-method' 'coerce,SpatialPolygridDataFrame,
###   SpatialGridDataFrame-method' 'coerce,SpatialPointsDataFrame,
###   SpatialPolygridDataFrame-method'
###   coordinates,SpatialPolygridDataFrame-method
###   proj4string,SpatialPolygridDataFrame-method
###   bbox,SpatialPolygridDataFrame-method
###   spplot,SpatialPolygridDataFrame-method
###   length,SpatialPolygridDataFrame-method cbind.SpatialPolygridDataFrame
### Keywords: classes

### ** Examples

# prepare 
index1 = as.integer(
  c( 6, 6, 7, 7, 8, 8,
     6, 6, 7, 7, 8, 8,
     5, 5, 1, 2, 9, 9,
     5, 5, 4, 3, 9, 9,
     12,12,11,11,10,10,
     12,12,11,11,10,10))
dataFrame1 = data.frame(a = 1:12 * 10, b = 2^(12:1))
grid1 = GridTopology(c(1,1), c(2,2), c(6,6))
spatialGrid1 = SpatialGrid(grid1, CRS("+proj=longlat +datum=WGS84"))

#- - create object by function SpatialPolygridDataFrame - -#
SPolygridDF1 = SpatialPolygridDataFrame(
  grid = grid1,
  data = dataFrame1,
  index = index1,
  proj4string = CRS("+proj=longlat +datum=WGS84"))

#- - - - coerce from SpatialGridDataFrame - - - - - - - -#
spatialGridDataFrame1 = SpatialGridDataFrame(
    grid = spatialGrid1, data = dataFrame1[index1,])
# coerce, each cell keeps individual values
s = as(spatialGridDataFrame1, "SpatialPolygridDataFrame")

# coerce back (name of coordinates may change)
#spatialGridDataFrame2 = as(SPolygridDF2, "SpatialGridDataFrame")
spatialGridDataFrame2 = as(s, "SpatialGridDataFrame")

#- - - - coerce from SpatialPointsDataFrame - - - - - - - #
# from irregular points, grid is created, cells are assigned values of nearest point
spatialPoints1 = SpatialPoints(coordinates(SPolygridDF1) + runif(24))
spatialPointsDataFrame1 = SpatialPointsDataFrame(
    coords = spatialPoints1, data = dataFrame1)
## Not run: 
##D ## takes some seconds
##D SPolygridDF3 = as(spatialPointsDataFrame1, "SpatialPolygridDataFrame")
##D 
##D 
##D # from regular points: one cell per point
##D spatialPointsDataFrame2 = as(spatialGridDataFrame1, "SpatialPointsDataFrame")
##D SPolygridDF4 = as(spatialPointsDataFrame2, "SpatialPolygridDataFrame")
##D 
##D # - - - - - - - - - - - - - coordinates - - - - - - - - - - - - #
##D # compare irregular input points and centroids of output
##D plot(spatialPoints1)
##D points(coordinates(SPolygridDF3))
##D 
##D # - - - - - - - - - - - - - proj4string - - - - - - - - - - - -  #
##D # only to retrieve projection attributes
##D #proj4string(SPolygridDF2)
##D proj4string(s)
##D proj4string(SPolygridDF3)
##D # - - - - - - - - - - - - - proj4string - - - - - - - - - - - -  #
##D bbox(SPolygridDF3)
##D # - - - - - - - - - - - spplot - - - - - - - - - - - - - - - - #
##D 
##D ## takes some time
##D # plot map with original points
##D spplot(SPolygridDF3, zcol = "a", 
##D   sp.layout = list(list("sp.points", spatialPoints1, col = 8)))
##D # plot map with centres of polygrid cells
##D spplot(SPolygridDF4, zcol = "a", col.regions = rainbow(16),
##D   sp.layout = list("sp.points", spatialPointsDataFrame2@coords, col = 8))
##D 
##D 
##D # - - - - - - - - - - - - cbind - - - - - - - - - - - - - - - - #
##D #SPolygridDF5 = cbind(SPolygridDF2, SPolygridDF4) 
##D SPolygridDF5 = cbind(s, SPolygridDF4) 
## End(Not run)



