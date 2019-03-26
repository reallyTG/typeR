library(sp)


### Name: SpatialPolygonsDataFrame-class
### Title: Class "SpatialPolygonsDataFrame"
### Aliases: SpatialPolygonsDataFrame-class
###   [,SpatialPolygonsDataFrame-method
###   as.data.frame.SpatialPolygonsDataFrame
###   coerce,SpatialPolygonsDataFrame,data.frame-method
###   coerce,SpatialPolygonsDataFrame,SpatialLinesDataFrame-method
###   coerce,SpatialPolygonsDataFrame,SpatialPolygons-method
###   rbind.SpatialPolygonsDataFrame dim.SpatialPolygonsDataFrame
###   row.names.SpatialPolygonsDataFrame
### Keywords: classes

### ** Examples

# simple example, from scratch:
Sr1 = Polygon(cbind(c(2,4,4,1,2),c(2,3,5,4,2)))
Sr2 = Polygon(cbind(c(5,4,2,5),c(2,3,2,2)))
Sr3 = Polygon(cbind(c(4,4,5,10,4),c(5,3,2,5,5)))
Sr4 = Polygon(cbind(c(5,6,6,5,5),c(4,4,3,3,4)), hole = TRUE)

Srs1 = Polygons(list(Sr1), "s1")
Srs2 = Polygons(list(Sr2), "s2")
Srs3 = Polygons(list(Sr3, Sr4), "s3/4")
SpP = SpatialPolygons(list(Srs1,Srs2,Srs3), 1:3)
plot(SpP, col = 1:3, pbg="white")

grd <- GridTopology(c(1,1), c(1,1), c(10,10))
polys <- as(grd, "SpatialPolygons")
centroids <- coordinates(polys)
x <- centroids[,1]
y <- centroids[,2]
z <- 1.4 + 0.1*x + 0.2*y + 0.002*x*x
ex_1.7 <- SpatialPolygonsDataFrame(polys,
 data=data.frame(x=x, y=y, z=z, row.names=row.names(polys)))
brks <- quantile(z, seq(0,1,1/7))
cols <- grey((length(brks):2)/length(brks))
dens <- (2:length(brks))*3
plot(ex_1.7, col=cols[findInterval(z, brks, all.inside=TRUE)])
plot(ex_1.7, density=dens[findInterval(z, brks, all.inside=TRUE)])



