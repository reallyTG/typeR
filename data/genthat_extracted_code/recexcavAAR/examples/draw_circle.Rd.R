library(recexcavAAR)


### Name: draw_circle
### Title: Draws a circular point cloud (3D)
### Aliases: draw_circle

### ** Examples

draw_circle(
  centerx = 4,
  centery = 5,
  centerz = 1,
  radius = 3,
  resolution = 20
)

circ <- draw_circle(1,2,3,2)

plot(circ$x, circ$y)




