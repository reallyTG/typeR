library(seg)


### Name: spseg
### Title: Spatial Segregation Measures
### Aliases: spseg spatseg

### ** Examples

# uses the idealised landscapes in 'segdata'
data(segdata)
grd <- GridTopology(cellcentre.offset=c(0.5,0.5),
                    cellsize=c(1,1), cells.dim=c(10,10))
grd.sp <- as.SpatialPolygons.GridTopology(grd)
test.df <- segdata[,1:2]

# no spatial smoothing
xx1 <- spseg(grd.sp, data = test.df)
print(xx1, digits = 3)

# plots the values in the slot 'data'
spplot(xx1, main = "No spatial smoothing")

# smoothes the data points
xx2 <- spseg(grd.sp, data = test.df, smoothing = "equal")
print(xx2, digits = 3)
spplot(xx2, main = "Equal")

# uses the kernel smoothing of the data points
xx3 <- spseg(grd.sp, data = test.df, smoothing = "kernel", 
             nrow = 20, ncol = 20)
print(xx3, digits = 3)
spplot(xx3, main = "Kernel")

## Not run: 
##D # same as the above but with a boundary polygon
##D w <- matrix(c(1.5, 1.5,
##D               1.5, 8.5,
##D               8.5, 8.5,
##D               8.5, 4.5,
##D               5.5, 4.5,
##D               5.5, 1.5), ncol = 2, byrow = TRUE)
##D xx4 <- spseg(grd.sp, data = segdata[,1:2], smoothing = "kernel", 
##D              window = w, nrow = 20, ncol = 20)
##D print(xx4, digits = 3)
##D spplot(xx4, main = "Kernel with a boundary polygon")
##D 
##D # retrieves the index values
##D as.list(xx4)
##D 
##D # shows the values in the slot 'env'
##D spplot(as(xx4, "SegLocal"), main = "Local population composition")
## End(Not run)



