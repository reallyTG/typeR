library(recexcavAAR)


### Name: fillhexa
### Title: Fills hexahedrons with a regular point raster (3D)
### Aliases: fillhexa

### ** Examples

hexatestdf <- data.frame(
  x = c(0,1,0,4,5,5,5,5),
  y = c(1,1,4,4,1,1,4,4),
  z = c(4,8,4,9,4,8,4,6)
)

cx = fillhexa(hexatestdf, 0.1)

#library(rgl)
#plot3d(
# cx[,1], cx[,2], cx[,3],
# type = "p",
# xlab = "x", ylab = "y", zlab = "z"
#)




