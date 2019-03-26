library(plot3D)


### Name: 3-D volume visualisation
### Title: Functions for plotting 3-D volumetric data.
### Aliases: slice3D slicecont3D isosurf3D triangle3D voxel3D createisosurf
###   createvoxel
### Keywords: hplot

### ** Examples

# save plotting parameters
 pm <- par("mfrow")
 pmar <- par("mar")

## =======================================================================
## Simple slice3D examples
## =======================================================================

 par(mfrow = c(2, 2))
 x <- y <- z <- seq(-1, 1, by = 0.1)
 grid   <- mesh(x, y, z)
 colvar <- with(grid, x*exp(-x^2 - y^2 - z^2))

# default is just the panels
 slice3D  (x, y, z, colvar = colvar, theta = 60)

# contour slices
 slicecont3D (x, y, z, ys = seq(-1, 1, by = 0.5), colvar = colvar, 
           theta = 60, border = "black")
          
 slice3D  (x, y, z, xs = c(-1, -0.5, 0.5), ys = c(-1, 0, 1), 
           zs = c(-1, 0), colvar = colvar, 
           theta = 60, phi = 40)

## =======================================================================
## coloring on a surface
## =======================================================================

 XY <- mesh(x, y)
 ZZ <- XY$x*XY$y
 slice3D  (x, y, z, xs = XY$x, ys = XY$y, zs = ZZ, colvar = colvar, 
           lighting =  TRUE, lphi = 90, ltheta = 0)

## =======================================================================
## Specifying transparent colors
## =======================================================================

 par(mfrow = c(1, 1))
 x <- y <- z <- seq(-4, 4, by = 0.2)
 M <- mesh(x, y, z)

 R <- with (M, sqrt(x^2 + y^2 + z^2))
 p <- sin(2*R) /(R+1e-3)

## Not run: 
##D # This is very slow - alpha = 0.5 makes it transparent
##D 
##D  slice3D(x, y, z, colvar = p, col = jet.col(alpha = 0.5), 
##D          xs = 0, ys = c(-4, 0, 4), zs = NULL, d = 2) 
## End(Not run)

 slice3D(x, y, z, colvar = p, d = 2, theta = 60, border = "black",
         xs = c(-4, 0), ys = c(-4, 0, 4), zs = c(-4, 0))

## =======================================================================
## A section along a transect
## =======================================================================

 data(Oxsat)
 Ox <- Oxsat$val[,  Oxsat$lat > - 5 & Oxsat$lat < 5, ]
 slice3D(x = Oxsat$lon, z = -Oxsat$depth, y = 1:5, colvar = Ox, 
         ys = 1:5, zs = NULL, NAcol = "black", 
         expand = 0.4, theta = 45, phi = 45)

## =======================================================================
## isosurf3D example - rather slow
## =======================================================================

 par(mfrow = c(2, 2), mar  = c(2, 2, 2, 2))
 x <- y <- z <- seq(-2, 2, length.out = 15)
 xyz <- mesh(x, y, z)
 F <- with(xyz, log(x^2 + y^2 + z^2 + 
                10*(x^2 + y^2) * (y^2 + z^2) ^2))

# use shading for level = 1 - show triangulation with border
 isosurf3D(x, y, z, F, level = 1, shade = 0.9, 
           col = "yellow", border = "orange")

# lighting for level - 2
 isosurf3D(x, y, z, F, level = 2, lighting = TRUE,
           lphi = 0, ltheta = 0, col = "blue", shade = NA)  
 
# three levels, transparency added
 isosurf3D(x, y, z, F, level = seq(0, 4, by = 2), 
   col = c("red", "blue", "yellow"), 
   clab = "F", alpha = 0.2, theta = 0, lighting = TRUE)  

# transparency can also be added afterwards with plotdev()
## Not run: 
##D  isosurf3D(x, y, z, F, level = seq(0, 4, by = 2), 
##D    col = c("red", "blue", "yellow"), 
##D    shade = NA, plot = FALSE, clab = "F")  
##D  plotdev(lighting = TRUE, alpha = 0.2, theta = 0)
## End(Not run)
# use of creatisosurf
 iso <- createisosurf(x, y, z, F, level = 2)
 head(iso)
 triangle3D(iso, col = "green", shade = 0.3)

## Not run: 
##D  # higher resolution
##D   x <- y <- z <- seq(-2, 2, length.out = 50)
##D   xyz <- mesh(x, y, z)
##D   F <- with(xyz, log(x^2 + y^2 + z^2 + 
##D                 10*(x^2 + y^2) * (y^2 + z^2) ^2))
##D 
##D # three levels
##D   isosurf3D(x, y, z, F, level = seq(0, 4, by = 2), 
##D     col = c("red", "blue", "yellow"), 
##D     shade = NA, plot = FALSE, clab = "F")  
##D   plotdev(lighting = TRUE, alpha = 0.2, theta = 0)
## End(Not run)

## =======================================================================
## voxel3D example
## =======================================================================

 par(mfrow = c(2, 2), mar  = c(2, 2, 2, 2))

# fast but needs high resolution grid
 x <- y <- z <- seq(-2, 2, length.out = 70)
 xyz <- mesh(x, y, z)
 F <- with(xyz, log(x^2 + y^2 + z^2 + 
                10*(x^2 + y^2) * (y^2 + z^2) ^2))

 voxel3D(x, y, z, F, level = 4, pch = ".", cex = 5)

## =======================================================================
## rotation 
## =======================================================================

 plotdev(theta = 45, phi = 0)
 plotdev(theta = 90, phi = 10)

# same using createvoxel -  more flexible for coloring
 vox <- createvoxel(x, y, z, F, level = 4)
 scatter3D(vox$x, vox$y, vox$z, colvar = vox$y, 
   bty = "g", colkey = FALSE)


## =======================================================================
## voxel3D to show hypox sites
## =======================================================================

 par(mfrow = c(1, 1), mar = c(2, 2, 2, 2))
 Hypox <- createvoxel(Oxsat$lon, Oxsat$lat, Oxsat$depth[1:19], 
                      Oxsat$val[,,1:19], level = 40, operator = "<")

 panel <- function(pmat) {  # an image at the bottom
   Nx <- length(Oxsat$lon)
   Ny <- length(Oxsat$lat)
   M <- mesh(Oxsat$lon, Oxsat$lat) 
   xy <- trans3D(pmat = pmat, x = as.vector(M$x), y = as.vector(M$y), 
        z = rep(-1000, length.out = Nx*Ny)) 
   x <- matrix(nrow = Nx, ncol = Ny, data = xy$x)
   y <- matrix(nrow = Nx, ncol = Ny, data = xy$y)
   Bat <- Oxsat$val[,,1]; Bat[!is.na(Bat)] <- 1
   image2D(x = x, y = y, z = Bat, NAcol = "black", col = "grey",
         add = TRUE, colkey = FALSE)
 }
   
 scatter3D(Hypox$x, Hypox$y, -Hypox$z, colvar = Hypox$cv, 
           panel.first = panel, pch = ".", bty = "b", 
           theta = 30, phi = 20, ticktype = "detailed",
           zlim = c(-1000,0), xlim = range(Oxsat$lon), 
           ylim = range(Oxsat$lat) )
           
# restore plotting parameters
 par(mfrow = pm)
 par(mar = pmar)



