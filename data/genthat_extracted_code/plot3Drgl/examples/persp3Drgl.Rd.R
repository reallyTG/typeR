library(plot3Drgl)


### Name: persp3Drgl
### Title: 3-D plotting functions using rgl.
### Aliases: persp3Drgl ribbon3Drgl hist3Drgl scatter3Drgl points3Drgl
###   lines3Drgl slice3Drgl slicecont3Drgl isosurf3Drgl voxel3Drgl
###   triangle3Drgl surf3Drgl spheresurf3Drgl segments3Drgl image3Drgl
###   contour3Drgl box3Drgl border3Drgl rect3Drgl text3Drgl
### Keywords: hplot

### ** Examples


## =======================================================================
## perspective plots
## =======================================================================
 persp3Drgl(z = volcano, contour = list(side = "zmax"))

# ribbon, in x--direction
 V <- volcano[seq(1, nrow(volcano), by = 5), 
              seq(1, ncol(volcano), by = 5)]  # lower resolution
 ribbon3Drgl(z = V, ticktype = "detailed")
 hist3Drgl(z = V, col = "grey", border = "black", lighting = TRUE)
 
## Not run: 
##D   cutrgl()    # select a rectangle
##D   uncutrgl()
## End(Not run)

## =======================================================================
## scatter points
## =======================================================================

 with(quakes, scatter3Drgl(x = long, y = lat, z = -depth, 
   colvar = mag, cex = 3))

 plotdev()   # plots same on oridinary device...
 
## =======================================================================
## 3D surface
## =======================================================================

 M  <- mesh(seq(0, 2*pi, length.out = 50), 
            seq(0, 2*pi, length.out = 50))
 u  <- M$x ; v  <- M$y

 x  <- sin(u)
 y  <- sin(v)
 z  <- sin(u + v)

# alpha makes colors transparent
 surf3Drgl(x, y, z, colvar = z, border = "black", smooth  = TRUE, 
   alpha = 0.2)

## =======================================================================
## volumetric data
## =======================================================================
 x <- y <- z <- seq(-4, 4, by = 0.2)
 M <- mesh(x, y, z)

 R <- with (M, sqrt(x^2 + y^2 + z^2))
 p <- sin(2*R) /(R+1e-3)

 slice3Drgl(x, y, z, colvar = p, col = jet.col(alpha = 0.5), 
         xs = 0, ys = c(-4, 0, 4), zs = NULL, d = 2) 




