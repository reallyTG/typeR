library(ipdw)


### Name: costrasterGen
### Title: Generate a cost Raster
### Aliases: costrasterGen

### ** Examples

## Not run: 
##D Sr1 <- Polygon(cbind(c(0, 0, 1, 1, 0), c(0, 12, 12, 0, 0)))
##D Sr4 <- Polygon(cbind(c(9, 9, 10, 10, 9), c(0, 12, 12, 0, 0)))
##D Sr2 <- Polygon(cbind(c(1, 1, 9, 9, 1), c(11, 12, 12, 11, 11)))
##D Sr3 <- Polygon(cbind(c(1, 1, 9, 9, 1),c(0, 1, 1, 0, 0)))
##D Sr5 <- Polygon(cbind(c(4, 4, 5, 5, 4), c(4, 8, 8, 4, 4)))
##D Srs1 <- Polygons(list(Sr1), "s1")
##D Srs2 <- Polygons(list(Sr2), "s2")
##D Srs3 <- Polygons(list(Sr3), "s3")
##D Srs4 <- Polygons(list(Sr4), "s4")
##D Srs5 <- Polygons(list(Sr5), "s5")
##D 
##D pols <- SpatialPolygons(list(Srs1, Srs2, Srs3, Srs4, Srs5), 1:5)
##D 
##D #using a matrix object
##D xymat <- matrix(3, 3, nrow = 1, ncol = 2)
##D costras <- costrasterGen(xymat, pols, projstr = NULL)
##D 
##D #plotting
##D plot(costras)
##D points(xymat)
## End(Not run)



