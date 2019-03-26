library(recexcavAAR)


### Name: spitcenter
### Title: Center determination for hexahedrons
### Aliases: spitcenter

### ** Examples

hexatestdf <- data.frame(
  x = c(0,1,0,4,5,5,5,5),
  y = c(1,1,4,4,1,1,4,4),
  z = c(4,8,4,9,4,8,4,6)
)

center <- spitcenter(hexatestdf)

#library(rgl)
#plot3d(
# hexatestdf$x, hexatestdf$y, hexatestdf$z,
# type = "p",
# xlab = "x", ylab = "y", zlab = "z"
#)
#plot3d(
#  center[1], center[2], center[3],
#  type = "p",
#  col = "red",
#  add = TRUE
#)




