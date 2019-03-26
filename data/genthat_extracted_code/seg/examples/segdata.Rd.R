library(seg)


### Name: segdata
### Title: Hypothetical Patterns of Segregation
### Aliases: segdata
### Keywords: datasets

### ** Examples

data(segdata)
grd <- GridTopology(cellcentre.offset=c(0.5,0.5),
                    cellsize=c(1,1), cells.dim=c(10,10))
grd.sp <- as.SpatialPolygons.GridTopology(grd)

pd <- par()
par(mfrow = c(2, 4), mar = c(0, 1, 0, 1))
for (i in 1:8) {
  full <- segdata[,(2*i)-1] == 100
  half <- segdata[,(2*i)-1] == 50
  plot(grd.sp)
  plot(grd.sp[full,], col = "Black", add = TRUE)
  if (any(half))
    plot(grd.sp[half,], col = "Grey", add = TRUE)
  text(5, 11.5, labels = paste("Pattern", LETTERS[i]))
}
par(mfrow = pd$mfrow, mar = pd$mar)



