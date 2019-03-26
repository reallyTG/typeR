library(dismo)


### Name: Geographic Distance
### Title: Geographic distance model
### Aliases: geoDist geoDist,SpatialPoints-method geoDist,matrix-method
###   geoDist,data.frame-method GeographicDistance-class
### Keywords: spatial

### ** Examples

r <- raster(system.file("external/rlogo.grd", package="raster"))
#presence data
pts <- matrix(c(17, 42, 85, 70, 19, 53, 26, 84, 84, 46, 48, 85, 4, 95, 48, 54, 66, 74, 50, 48, 
        28, 73, 38, 56, 43, 29, 63, 22, 46, 45, 7, 60, 46, 34, 14, 51, 70, 31, 39, 26), ncol=2)
colnames(pts) <- c('x', 'y')

train <- pts[1:12, ]
test <- pts[13:20, ]
				 
gd <- geoDist(train, lonlat=FALSE)
p <- predict(gd, r)

## Not run: 
##D plot(p)
##D points(test, col='black', pch=20, cex=2)
##D points(train, col='red', pch=20, cex=2)
## End(Not run)



