library(plot3D)


### Name: 3-D contours
### Title: Contours in 3-D plots.
### Aliases: contour3D
### Keywords: hplot

### ** Examples

# save plotting parameters
 pm <- par("mfrow")

## =======================================================================
## Contours
## =======================================================================
 par (mfrow = c(2, 2))

 r <- 1:nrow(volcano)
 c <- 1:ncol(volcano)
 contour3D(x = r, y = c, z = 100, colvar = volcano, zlim = c(0, 150),
   clab = c("height", "m"))

 contour3D(x = 100, y = r, z = c, colvar = volcano, clab = c("height", "m"))

 contour3D(z = volcano, colvar = volcano, lwd = 2, 
   nlevels = 20, clab = c("height", "m"), colkey = FALSE)

 contour3D(y = volcano, colvar = volcano, lwd = 2, 
   nlevels = 10, clab = c("height", "m"))

## =======================================================================
## Composite images and contours in 3D
## =======================================================================
 persp3D(z = volcano, zlim = c(90, 300), col = "white", 
         shade = 0.1, d = 2, plot = FALSE)
 contour3D(z = volcano, colvar = volcano, lwd = 2, add = TRUE, 
         nlevels = 20, clab = c("height", "m"), plot = FALSE,
         colkey = list(at = seq(90, 190, length.out = 5)))
 contour3D(z = 300, colvar = volcano, lwd = 2, col = "grey",
         add = TRUE, nlevels = 5)
          
## =======================================================================
## the viewing depth of contours (dDepth)
## =======================================================================

# too low
 persp3D(z = volcano, col = "white", shade = 0.1, plot = FALSE)
 contour3D(z = volcano, colvar = volcano, lwd = 2, 
         add = TRUE, dDepth = 0, col = "black")

# default
 persp3D(z = volcano, col = "white", shade = 0.1, plot = FALSE)
 contour3D(z = volcano, colvar = volcano, lwd = 2, 
         add = TRUE, dDepth = 0.1, col = "black")

# too high
 persp3D(z = volcano, col = "white", shade = 0.1, plot = FALSE)
 contour3D(z = volcano, colvar = volcano, lwd = 1, 
         add = TRUE, dDepth = 0.5, col = "black")

# reset plotting parameters
 par(mfrow = pm)



