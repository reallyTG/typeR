library(raster)


### Name: rasterize
### Title: Rasterize points, lines, or polygons
### Aliases: rasterize rasterize,matrix,Raster-method
###   rasterize,data.frame,Raster-method rasterize,sf,Raster-method
###   rasterize,SpatialPoints,Raster-method
###   rasterize,SpatialLines,Raster-method
###   rasterize,SpatialPolygons,Raster-method
###   rasterize,Extent,Raster-method
### Keywords: methods spatial

### ** Examples


###############################
# rasterize points
###############################
r <- raster(ncols=36, nrows=18)
n <- 1000
set.seed(123)
x <- runif(n) * 360 - 180
y <- runif(n) * 180 - 90
xy <- cbind(x, y)
# get the (last) indices
r0 <- rasterize(xy, r)
# presence/absensce (NA) (is there a point or not?)
r1 <- rasterize(xy, r, field=1)
# how many points?
r2 <- rasterize(xy, r, fun=function(x,...)length(x))
vals <- runif(n)
# sum of the values associated with the points
r3 <- rasterize(xy, r, vals, fun=sum)

# with a SpatialPointsDataFrame
vals <- 1:n
p <- data.frame(xy, name=vals)
coordinates(p) <- ~x+y
r <- rasterize(p, r, 'name', fun=min)
#r2 <- rasterize(p, r, 'name', fun=max)
#plot(r, r2, cex=0.5)

###############################
# rasterize lines
###############################
cds1 <- rbind(c(-180,-20), c(-140,55), c(10, 0), c(-140,-60))
cds2 <- rbind(c(-10,0), c(140,60), c(160,0), c(140,-55))
cds3 <- rbind(c(-125,0), c(0,60), c(40,5), c(15,-45))

lines <- spLines(cds1, cds2, cds3)

r <- raster(ncols=90, nrows=45)
r <- rasterize(lines, r)

## Not run: 
##D plot(r)
##D plot(lines, add=TRUE)
##D 
##D r <- rasterize(lines, r, fun='count')
##D plot(r)
##D 
##D r[] <- 1:ncell(r)
##D r <- rasterize(lines, r, mask=TRUE)
##D plot(r)
##D 
##D r[] <- 1
##D r[lines] <- 10
##D plot(r)
## End(Not run)

###############################
# rasterize polygons
###############################

p1 <- rbind(c(-180,-20), c(-140,55), c(10, 0), c(-140,-60), c(-180,-20))
hole <- rbind(c(-150,-20), c(-100,-10), c(-110,20), c(-150,-20))
p1 <- list(p1, hole)
p2 <- rbind(c(-10,0), c(140,60), c(160,0), c(140,-55), c(-10,0))
p3 <- rbind(c(-125,0), c(0,60), c(40,5), c(15,-45), c(-125,0))

pols <- spPolygons(p1, p2, p3)

r <- raster(ncol=90, nrow=45)
r <- rasterize(pols, r, fun=sum)


## Not run: 
##D 
##D plot(r)
##D plot(pols, add=T)
##D 
##D # add a polygon
##D p5 <- rbind(c(-180,10), c(0,90), c(40,90), c(145,-10),
##D             c(-25, -15), c(-180,0), c(-180,10))
##D addpoly <- SpatialPolygons(list(Polygons(list(Polygon(p5)), 1)))
##D addpoly <- as(addpoly, "SpatialPolygonsDataFrame")
##D addpoly@data[1,1] <- 10
##D r2 <- rasterize(addpoly, r, field=1, update=TRUE, updateValue="NA")
##D plot(r2)
##D plot(pols, border="blue", lwd=2, add=TRUE)
##D plot(addpoly, add=TRUE, border="red", lwd=2)
##D 
##D # get the percentage cover of polygons in a cell
##D r3 <- raster(ncol=36, nrow=18)
##D r3 <- rasterize(pols, r3, getCover=TRUE)
## End(Not run)



