library(RSAGA)


### Name: rsaga.union.polygons
### Title: Spatial union of two polygon layers
### Aliases: rsaga.union.polygons
### Keywords: operations, polygons vector

### ** Examples

## Not run: 
##D library("RSAGA")
##D library("sp")
##D # construct coordinates of two squares
##D coords_1 <- matrix(data = c(0, 0, 1, 0, 1, 1, 0, 1, 0, 0),
##D                  ncol = 2, byrow = TRUE)
##D coords_2 <- matrix(data = c(-0.5, -0.5, 0.5, -0.5, 0.5, 0.5, -0.5, 0.5,
##D                             -0.5, -0.5),
##D                  ncol = 2, byrow = TRUE)
##D # convert the coordinates into polygons
##D poly_1 <- SpatialPolygons(list(Polygons(list(Polygon(coords_1)), 1)))
##D poly_1 <- SpatialPolygonsDataFrame(poly_1, data = data.frame(id = 1))
##D poly_2 <- SpatialPolygons(list(Polygons(list(Polygon(coords_2)), 1)))
##D poly_2 <- SpatialPolygonsDataFrame(poly_2, data = data.frame(id_2 = 2))
##D # union the two polygons using SAGA and load the output
##D dir_tmp <- paste0(tempdir(), "/out.shp")
##D res <- rsaga.union.polygons(layer_a = poly_1,
##D                             layer_b = poly_2,
##D                             result = dir_tmp,
##D                             load = TRUE)
##D # output attribute table consists of three elements, i.e. the union of poly_1
##D # and poly_2
##D dim(res)
##D res@data
## End(Not run)



