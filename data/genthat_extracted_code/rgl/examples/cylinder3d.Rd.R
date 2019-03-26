library(rgl)


### Name: cylinder3d
### Title: Create cylindrical or "tube" plots.
### Aliases: cylinder3d
### Keywords: dynamic

### ** Examples

# A trefoil knot
open3d()
theta <- seq(0, 2*pi, len = 25)
knot <- cylinder3d(
      center = cbind(
        sin(theta) + 2*sin(2*theta), 
        2*sin(3*theta), 
        cos(theta) - 2*cos(2*theta)),
      e1 = cbind(
        cos(theta) + 4*cos(2*theta), 
        6*cos(3*theta), 
        sin(theta) + 4*sin(2*theta)),
      radius = 0.8, 
      closed = TRUE)
                     
shade3d(addNormals(subdivision3d(knot, depth = 2)), col = "green")  



