library(recexcavAAR)


### Name: rotate
### Title: Rotate a point cloud around a pivot point (3D)
### Aliases: rotate

### ** Examples

circ <- draw_circle(0,0,0,5)

#library(rgl)
#plot3d(
#  circ,
#  xlim = c(-6,6),
#  ylim = c(-6,6),
#  zlim = c(-6,6)
#)

rotcirc <- rotate(circ$x, circ$y, circ$z, degrx = 45)

#plot3d(
#  rotcirc,
#  xlim = c(-6,6),
#  ylim = c(-6,6),
#  zlim = c(-6,6)
#)




