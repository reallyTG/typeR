library(raster)


### Name: sp
### Title: Create SpatialLines* or SpatialPolygons*
### Aliases: spLines spPolygons
### Keywords: spatial

### ** Examples

x1 <- rbind(c(-180,-20), c(-140,55), c(10, 0), c(-140,-60))
x2 <- rbind(c(-10,0), c(140,60), c(160,0), c(140,-55))
x3 <- rbind(c(-125,0), c(0,60), c(40,5), c(15,-45))
x4 <- rbind(c(41,-41.5), c(51,-35), c(62,-41), c(51,-50))

a <- spLines(x1, x2, x3)
b <- spLines(x1, list(x2, x3), attr=data.frame(id=1:2), crs='+proj=longlat +datum=WGS84')
b

hole <- rbind(c(-150,-20), c(-100,-10), c(-110,20), c(-130,10))
d <- spPolygons(list(x1,hole), x2, list(x3, x4))

att <- data.frame(ID=1:3, name=c('a', 'b', 'c'))
e <- spPolygons(list(x1,hole), x2, list(x3, x4), attr=att, crs='+proj=longlat +datum=WGS84')
e



