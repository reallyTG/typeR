library(dismo)


### Name: CirclesRange
### Title: Circles range
### Aliases: circles circles,SpatialPoints-method circles,matrix-method
###   circles,data.frame-method CirclesRange-class
### Keywords: spatial

### ** Examples

r <- raster(system.file("external/rlogo.grd", package="raster"))
#presence data
pts <- matrix(c(17, 42, 85, 70, 19, 53, 26, 84, 84, 46, 48, 85, 4, 95, 48, 54, 66,
 74, 50, 48, 28, 73, 38, 56, 43, 29, 63, 22, 46, 45, 7, 60, 46, 34, 14, 51, 70, 31, 39, 26), ncol=2)
train <- pts[1:12, ]
test <- pts[13:20, ]
				 
cc <- circles(train, lonlat=FALSE)
predict(cc, test)

plot(r)
plot(cc, border='red', lwd=2, add=TRUE)
points(train, col='red', pch=20, cex=2)
points(test, col='black', pch=20, cex=2)

pr <- predict(cc, r, progress='')
plot(r, legend=FALSE)
plot(pr, add=TRUE, col='blue')
points(test, col='black', pch=20, cex=2)
points(train, col='red', pch=20, cex=2)


# to get the polygons:
p <- polygons(cc)
p

# to compute the Circular Area Range of a species (see Hijmans and Spooner, 2001)
pts <- train*10
ca100 <- polygons(circles(pts, d=100, lonlat=FALSE))
ca150 <- polygons(circles(pts, d=150, lonlat=FALSE))
sum(area(ca150)) / (pi*150^2)
sum(area(ca100)) / (pi*100^2)
par(mfrow=c(1,2))
plot(ca100); points(pts)
plot(ca150); points(pts)






