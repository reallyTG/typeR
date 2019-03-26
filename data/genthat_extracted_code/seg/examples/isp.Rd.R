library(seg)


### Name: isp
### Title: Index of Spatial Proximity
### Aliases: isp whiteseg

### ** Examples

# uses the idealised landscapes in 'segdata'
data(segdata)
grd <- GridTopology(cellcentre.offset=c(0.5,0.5),
                    cellsize=c(1,1), cells.dim=c(10,10))
grd.sp <- as.SpatialPolygons.GridTopology(grd)

d <- rep(NA, 8) # index of dissimilarity
p <- rep(NA, 8) # index of spatial proximity
for (i in 1:8) {
  idx <- 2 * i
  d[i] <- seg(segdata[,(idx-1):idx])
  p[i] <- whiteseg(grd.sp, data = segdata[,(idx-1):idx])
  full <- segdata[,(idx-1)] == 100
  half <- segdata[,(idx-1)] == 50
  plot(grd.sp)
  plot(grd.sp[full,], col = "Black", add = TRUE)
  if (any(half))
    plot(grd.sp[half,], col = "Grey", add = TRUE)
  text(5, 11.5, labels = 
       paste("D = ", round(d[i], 2), ", P = ", round(p[i], 2), sep = ""))
}



