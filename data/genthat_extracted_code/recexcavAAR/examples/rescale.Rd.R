library(recexcavAAR)


### Name: rescale
### Title: Scales a point cloud (3D)
### Aliases: rescale

### ** Examples

s <- draw_sphere(1,1,1,3)

#library(rgl)
#plot3d(s)

s2 <- rescale(s$x, s$y, s$z, scalex = 4, scalez = 5)

#library(rgl)
#plot3d(s2)




