library(plot3D)


### Name: 3-D surfaces
### Title: Functions for plotting 3 dimensional shapes
### Aliases: surf3D spheresurf3D
### Keywords: hplot

### ** Examples

# save plotting parameters
 pm   <- par("mfrow")
 pmar <- par("mar")

 par(mar = c(1, 1, 1, 1))

## =======================================================================
## A three-dimensional shape 
## (ala http://docs.enthought.com/mayavi/mayavi/mlab.html)
## =======================================================================

 par(mfrow = c(2, 2))
# create grid matrices
 X       <- seq(0, pi, length.out = 50)
 Y       <- seq(0, 2*pi, length.out = 50)
 M       <- mesh(X, Y)
 phi     <- M$x
 theta   <- M$y

# x, y and z grids
 r <- sin(4*phi)^3 + cos(2*phi)^3 + sin(6*theta)^2 + cos(6*theta)^4
 x <- r * sin(phi) * cos(theta)
 y <- r * cos(phi)
 z <- r * sin(phi) * sin(theta)

# full colored image
 surf3D(x, y, z, colvar = y, colkey = FALSE, shade = 0.5,
        box = FALSE, theta = 60)

# same, but just facets
 surf3D(x, y, z, colvar = y, colkey = FALSE, box = FALSE, 
        theta = 60, facets = FALSE)

# with colors and border, AND increasing the size
# (by reducing the x- y and z- ranges
 surf3D(x, y, z, colvar = y, colkey = FALSE, box = FALSE, 
        theta = 60, border = "black", xlim = range(x)*0.8, 
        ylim = range(y)*0.8, zlim = range(z)*0.8)

# Now with one color and shading
 surf3D(x, y, z, box = FALSE,
        theta = 60, col = "lightblue", shade = 0.9)

## Not run: 
##D  # rotation
##D   for (angle in seq(0, 360, by = 10))
##D     plotdev(theta = angle)
##D 
## End(Not run)

## =======================================================================
## Several other shapes 
## http://xahlee.info/surface/gallery.html
## =======================================================================

 par(mfrow = c(2, 2)) 
 # Shape 1
 M  <- mesh(seq(0,  6*pi, length.out = 50), 
            seq(pi/3, pi, length.out = 50))
 u  <- M$x ; v <- M$y

 x <- u/2 * sin(v) * cos(u)
 y <- u/2 * sin(v) * sin(u)
 z <- u/2 * cos(v)

 surf3D(x, y, z, colvar = z, colkey = FALSE, box = FALSE, phi = 50)

# Shape 2: add border
 M  <- mesh(seq(0, 2*pi, length.out = 50), 
            seq(0, 2*pi, length.out = 50))
 u  <- M$x ; v  <- M$y

 x  <- sin(u)
 y  <- sin(v)
 z  <- sin(u + v)

 surf3D(x, y, z, colvar = z, border = "black", 
        colkey = FALSE)

# shape 3: uses same mesh, other perspective (d >1)
 x <- (3 + cos(v/2)*sin(u) - sin(v/2)*sin(2*u))*cos(v)
 y <- (3 + cos(v/2)*sin(u) - sin(v/2)*sin(2*u))*sin(v)
 z <- sin(v/2)*sin(u) + cos(v/2)*sin(2*u)

 surf3D(x, y, z, colvar = z, colkey = FALSE, d = 2, facets = FALSE)

# shape 4: more complex colvar
 M  <- mesh(seq(-13.2, 13.2, length.out = 50), 
            seq(-37.4, 37.4, length.out = 50))
 u  <- M$x   ; v <- M$y

 b <- 0.4; r <- 1 - b^2; w <- sqrt(r)
 D <- b*((w*cosh(b*u))^2 + (b*sin(w*v))^2)
 x <- -u + (2*r*cosh(b*u)*sinh(b*u)) / D
 y <- (2*w*cosh(b*u)*(-(w*cos(v)*cos(w*v)) - sin(v)*sin(w*v))) / D
 z <- (2*w*cosh(b*u)*(-(w*sin(v)*cos(w*v)) + cos(v)*sin(w*v))) / D

 surf3D(x, y, z, colvar = sqrt(x + 8.3), colkey = FALSE, 
        theta = 10, border = "black", box = FALSE)
 box()

## =======================================================================
## A sphere, with box type with grid lines
## =======================================================================

 par(mar = c(2, 2, 2, 2))
 par(mfrow = c(1, 1))
 M  <- mesh(seq(0, 2*pi, length.out = 50), 
            seq(0,   pi, length.out = 50))
 u  <- M$x ; v  <- M$y

 x <- cos(u)*sin(v)
 y <- sin(u)*sin(v)
 z <- cos(v)

 colvar <- sin(u*6) * sin(v*6)

 surf3D(y, x, z, colvar = colvar, phi = 0, bty = "b2", 
        lighting = TRUE, ltheta = 40)

## =======================================================================
## Function spheresurf3D
## =======================================================================

 par(mfrow = c(2, 2))
 spheresurf3D()
 
# true ranges are [-1, 1]; set limits to [-0.8, 0.8] to make larger plots
 lim <- c(-0.8, 0.8)
 spheresurf3D(colkey = FALSE, xlim = lim, ylim = lim, zlim = lim)

 spheresurf3D(bty = "b", ticktype = "detailed", phi = 50)
 spheresurf3D(colvar = matrix(nrow = 30, data = runif(900)))
 
## =======================================================================
## Images on a sphere
## =======================================================================

 par(mfrow = c(1, 1), mar = c(1, 1, 1, 3))

 AA <- Hypsometry$z; AA[AA<=0] <- NA
 
 lim <- c(-0.8, 0.8)

# log transformation of color variable
 spheresurf3D(AA, NAcol = "black", theta = 90, phi = 30, box = FALSE,
   xlim = lim, ylim = lim, zlim = lim, log = "c")

# restore plotting parameters
 par(mfrow = pm)
 par(mar = pmar)



