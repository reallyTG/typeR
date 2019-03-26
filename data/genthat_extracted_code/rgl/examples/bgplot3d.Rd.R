library(rgl)


### Name: bgplot3d
### Title: Use base graphics for RGL background
### Aliases: bgplot3d legend3d
### Keywords: graphics

### ** Examples

x <- rnorm(100)
y <- rnorm(100)
z <- rnorm(100)
open3d()
# Needs to be a bigger window than the default
par3d(windowRect = c(100, 100, 612, 612))
Sys.sleep(0.1) # Allow sluggish window managers to catch up
parent <- currentSubscene3d()
mfrow3d(2, 2)
plot3d(x, y, z)
next3d(reuse = FALSE)
bgplot3d(plot(y, z))
next3d(reuse = FALSE)
bgplot3d(plot(x, z))
next3d(reuse = FALSE)
legend3d("center", c("2D Points", "3D Points"), pch = c(1, 16))
useSubscene3d(parent)



