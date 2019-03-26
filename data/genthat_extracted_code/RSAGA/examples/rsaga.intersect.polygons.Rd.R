library(RSAGA)


### Name: rsaga.intersect.polygons
### Title: Spatial intersection of two polygon layers
### Aliases: rsaga.intersect.polygons
### Keywords: operations, polygons vector

### ** Examples

## Not run: 
##D library("RSAGA")
##D library("sp")
##D library("magrittr")
##D # construct coordinates of two squares
##D coords_1 <- matrix(data = c(0, 0, 1, 0, 1, 1, 0, 1, 0, 0),
##D                  ncol = 2, byrow = TRUE)
##D coords_2 <- matrix(data = c(-0.5, -0.5, 0.5, -0.5, 0.5, 0.5, -0.5, 0.5,
##D                             -0.5, -0.5),
##D                  ncol = 2, byrow = TRUE)
##D # convert the coordinates into polygons
##D poly_1 <- SpatialPolygons(list(Polygons(list(Polygon(coords_1)), 1))) %>%
##D   as(., "SpatialPolygonsDataFrame")
##D poly_2 <- SpatialPolygons(list(Polygons(list(Polygon(coords_2)), 1))) %>%
##D   as(., "SpatialPolygonsDataFrame")
##D # intersect the two polygons using SAGA and load the output
##D dir_tmp <- paste0(tempdir(), "/out.shp")
##D res <- rsaga.intersect.polygons(layer_a = poly_1,
##D                                 layer_b = poly_2,
##D                                 result = dir_tmp,
##D                                 load = TRUE)
##D # plot input polygons
##D plot(poly_1, col = "red", axes = TRUE, xlim = c(-1, 1), ylim = c(-1, 1))
##D plot(poly_2, col = "blue", add = TRUE)
##D # plot the intersection
##D plot(res, col = "yellow", add = TRUE)
## End(Not run)



