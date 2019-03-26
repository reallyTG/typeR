library(dismo)


### Name: Convex Hull
### Title: Convex hull model
### Aliases: convHull convHull,SpatialPoints-method convHull,matrix-method
###   convHull,data.frame-method ConvexHull-class
### Keywords: spatial

### ** Examples

r <- raster(system.file("external/rlogo.grd", package="raster"))
#presence data
pts <- matrix(c(17, 42, 85, 70, 19, 53, 26, 84, 84, 46, 48, 85, 4, 95, 48, 54, 66, 
 74, 50, 48, 28, 73, 38, 56, 43, 29, 63, 22, 46, 45, 7, 60, 46, 34, 14, 51, 70, 31, 39, 26), ncol=2)
train <- pts[1:12, ]
test <- pts[13:20, ]
				 
ch <- convHull(train)
predict(ch, test)

plot(r)
plot(ch, border='red', lwd=2, add=TRUE)
points(train, col='red', pch=20, cex=2)
points(test, col='black', pch=20, cex=2)

pr <- predict(ch, r, progress='')
plot(pr)
points(test, col='black', pch=20, cex=2)
points(train, col='red', pch=20, cex=2)

# to get the polygons:
p <- polygons(ch)
p



