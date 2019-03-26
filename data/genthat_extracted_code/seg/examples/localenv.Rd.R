library(seg)


### Name: localenv
### Title: Local Population Composition
### Aliases: localenv localenv.get

### ** Examples

# uses the idealised landscapes in 'segdata'
data(segdata)
grd <- GridTopology(cellcentre.offset=c(0.5,0.5),
                    cellsize=c(1,1), cells.dim=c(10,10))
grd.sp <- as.SpatialPolygons.GridTopology(grd)

# complete segregation:
# negative exponential function of distance
xx1 <- localenv(grd.sp, data = segdata[,1:2])
spplot(xx1, main = "Negative exponential")

# inverse distance
xx2 <- localenv(grd.sp, data = segdata[,1:2], useExp = FALSE)
spplot(xx2, main = "Inverse distance")

# inverse distance with p = 0, i.e., weight all points equally
xx3 <- localenv(grd.sp, data = segdata[,1:2], useExp = FALSE, power = 0)
spplot(xx3, main = "Inverse distance with p = 0")

## Not run: 
##D # checkerboard pattern:
##D # negative exponential function with different p values
##D vv1 <- localenv(grd.sp, data = segdata[,5:6], power = 1)
##D spplot(vv1, main = "Negative exponetial with p = 1")
##D 
##D vv2 <- localenv(grd.sp, data = segdata[,5:6])
##D spplot(vv2, main = "Negative exponetial with p = 2")
##D 
##D vv3 <- localenv(grd.sp, data = segdata[,5:6], power = 3)
##D spplot(vv3, main = "Negative exponetial with p = 3")
## End(Not run)



