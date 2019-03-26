library(alphashape3d)


### Name: inashape3d
### Title: Test of the inside of an alpha-shape
### Aliases: inashape3d

### ** Examples


T1 <- rtorus(2000, 0.5, 2)
T2 <- rtorus(2000, 0.5, 2, ct = c(2, 0, 0), rotx = pi/2)
x <- rbind(T1, T2)
ashape3d.obj <- ashape3d(x, alpha = 0.4)
# Random sample of points in a plane
points <- matrix(c(5*runif(10000) - 2.5, rep(0.01, 5000)), nc = 3)
in3d <- inashape3d(ashape3d.obj, points = points)
plot(ashape3d.obj, transparency = 0.2)
colors <- ifelse(in3d, "blue", "green")
rgl.points(points, col = colors)




