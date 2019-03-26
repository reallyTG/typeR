library(rgl)


### Name: scene3d
### Title: Saves the current scene to a variable, and displays such
###   variables.
### Aliases: scene3d rglscene-class rglobject-class plot3d.rglscene
###   plot3d.rglobject print.rglscene print.rglobject
### Keywords: graphics

### ** Examples

open3d()
z <- 2 * volcano        # Exaggerate the relief
x <- 10 * (1:nrow(z))   # 10 meter spacing (S to N)
y <- 10 * (1:ncol(z))   # 10 meter spacing (E to W)
persp3d(x, y, z, col = "green3", aspect = "iso")

s <- scene3d()
# Make it bigger
s$par3d$windowRect <- 1.5*s$par3d$windowRect
# and draw it again
plot3d(s)



