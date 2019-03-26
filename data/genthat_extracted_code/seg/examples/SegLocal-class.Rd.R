library(seg)


### Name: SegLocal-class
### Title: Class SegLocal
### Aliases: SegLocal-class coerce,SegLocal,SpatialPoints-method
###   coerce,SegLocal,SpatialPointsDataFrame-method
###   coerce,SegLocal,SpatialPixelsDataFrame-method
###   coerce,SpatialPointsDataFrame,SegLocal-method
###   coerce,SpatialPolygonsDataFrame,SegLocal-method show,SegLocal-method
###   print.SegLocal-method plot.SegLocal-method points.SegLocal-method
###   spplot,SegLocal-method summary.SegLocal-method update.SegLocal-method
### Keywords: classes

### ** Examples

# creates 100 regularly-spaced data points and 3 population groups
xy <- expand.grid(1:10, 1:10)
colnames(xy) <- c("x", "y")
pop <- matrix(runif(300), ncol = 3)
colnames(pop) <- LETTERS[1:3]

# constructs an object of class 'SegLocal'
v <- SegLocal(coords = as.matrix(xy), data = pop, env = pop)
summary(v)

# updates the map projection information
v <- update(v, proj4string = CRS("+proj=nzmg +datum=nzgd49"))
summary(v)

# displays the (randomly-generated) local population data
par(mfrow = c(1, 3))
plot(v, main = paste("Data", colnames(pop)), xlab = "x", ylab = "y")
par(mfrow = c(1, 1))

# coverts the object to class 'Spatial'
plot(as(v, "SpatialPoints"))
spplot(v, col.regions = heat.colors(20))
v.sp <- as(v, "SpatialPixelsDataFrame")
is(v.sp)



