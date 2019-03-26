library(rgl)


### Name: rgl.user2window
### Title: Convert between rgl user and window coordinates
### Aliases: rgl.user2window rgl.window2user rgl.projection
### Keywords: dynamic

### ** Examples

open3d()
points3d(rnorm(100), rnorm(100), rnorm(100))
if (interactive() || !.Platform$OS == "unix") {
# Calculate a square in the middle of the display and plot it
square <- rgl.window2user(c(0.25, 0.25, 0.75, 0.75, 0.25), 
                          c(0.25, 0.75, 0.75, 0.25, 0.25), 0.5)
par3d(ignoreExtent = TRUE)
lines3d(square)
par3d(ignoreExtent = FALSE)
}



