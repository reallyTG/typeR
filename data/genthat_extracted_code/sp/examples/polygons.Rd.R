library(sp)


### Name: polygons
### Title: sets spatial coordinates to create spatial data, or retrieves
###   spatial coordinates
### Aliases: polygons<- polygons
### Keywords: manip

### ** Examples

grd <- GridTopology(c(1,1), c(1,1), c(10,10))
polys <- as.SpatialPolygons.GridTopology(grd)
centroids <- coordinates(polys)
x <- centroids[,1]
y <- centroids[,2]
z <- 1.4 + 0.1*x + 0.2*y + 0.002*x*x
df <- data.frame(x=x, y=y, z=z, row.names=row.names(polys))
polygons(df) <- polys
class(df)
summary(df)



