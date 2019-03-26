library(seg)


### Name: dissim
### Title: Index of Dissimilarity
### Aliases: dissim seg

### ** Examples

if (require(spdep)) { # package 'spdep' is required

  # uses the idealised landscapes in 'segdata'
  data(segdata)
  grd <- GridTopology(cellcentre.offset=c(0.5,0.5),
                      cellsize=c(1,1), cells.dim=c(10,10))
  grd.sp <- as.SpatialPolygons.GridTopology(grd)
  grd.nb <- nb2mat(poly2nb(grd.sp, queen = FALSE), style = "B")
  grd.nb <- grd.nb / sum(grd.nb)

  d <- rep(NA, 8); m <- rep(NA, 8)
  for (i in 1:8) {
    idx <- 2 * i
    d[i] <- seg(segdata[,(idx-1):idx])
    m[i] <- seg(segdata[,(idx-1):idx], grd.nb)
    full <- segdata[,(idx-1)] == 100
    half <- segdata[,(idx-1)] == 50
    plot(grd.sp)
    plot(grd.sp[full,], col = "Black", add = TRUE)
    if (any(half))
      plot(grd.sp[half,], col = "Grey", add = TRUE)
    text(5, 11.5, labels = paste("D = ", round(d[i], 2), 
                                 ", D(adj) = ", round(m[i], 2), sep = ""))
  }
}



