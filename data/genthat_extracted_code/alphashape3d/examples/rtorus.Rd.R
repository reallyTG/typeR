library(alphashape3d)


### Name: rtorus
### Title: Generate points in the torus
### Aliases: rtorus

### ** Examples


T1 <- rtorus(2000, 0.5, 2.5)
rgl.bbox()
rgl.points(T1, col = 4)

T2 <- rtorus(2000, 0.5, 2.5, ct = c(2, 0, 0.5), rotx = pi/2)
rgl.points(T2, col = 2)




