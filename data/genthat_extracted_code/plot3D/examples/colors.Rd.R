library(plot3D)


### Name: Colors
### Title: Colors, shading, lighting.
### Aliases: jet.col jet2.col gg.col gg2.col ramp.col alpha.col
### Keywords: hplot

### ** Examples

# save plotting parameters
 pm <- par("mfrow")
 pmar <- par("mar")

## =======================================================================
## Transparency and various color schemes
## =======================================================================

 par(mfrow = c(3, 3))
 for (alph in c(0.25, 0.75))
   image2D(volcano, alpha = alph, 
         main = paste("jet.col, alpha = ", alph))  
 image2D(volcano, main = "jet.col")
 image2D(volcano, col = jet2.col(100), main = "jet2.col")
 image2D(volcano, col = gg.col(100), main = "gg.col")
 image2D(volcano, col = gg2.col(100), main = "gg2.col")
 image2D(volcano, col = rainbow(100), main = "rainbow")
 image2D(volcano, col = terrain.colors(100), main = "terrain.colors")
 image2D(volcano, col = ramp.col(c("blue", "yellow", "green", "red")),
       main = "ramp.col")  

## =======================================================================
## Shading, lighting -  one color
## =======================================================================

# create grid matrices
 X      <- seq(0, pi, length.out = 50)
 Y      <- seq(0, 2*pi, length.out = 50)
 M      <- mesh(X, Y)
 phi    <- M$x
 theta  <- M$y

# x, y and z grids
 x <- sin(phi) * cos(theta)
 y <- cos(phi)
 z <- sin(phi) * sin(theta)

# these are the defaults
 p <- list(ambient = 0.3, diffuse = 0.6, specular = 1.,
           exponent = 20, sr = 0, alpha = 1)

 par(mfrow = c(3, 3), mar = c(0, 0, 0, 0))
 Col <- "red"

 surf3D(x, y, z, box = FALSE, col = Col, shade = 0.9)
 surf3D(x, y, z, box = FALSE, col = Col, lighting = TRUE)  
 surf3D(x, y, z, box = FALSE, col = Col, lighting = list(ambient = 0))
 surf3D(x, y, z, box = FALSE, col = Col, lighting = list(diffuse = 0))
 surf3D(x, y, z, box = FALSE, col = Col, lighting = list(diffuse = 1))
 surf3D(x, y, z, box = FALSE, col = Col, lighting = list(specular = 0))
 surf3D(x, y, z, box = FALSE, col = Col, lighting = list(exponent = 5))
 surf3D(x, y, z, box = FALSE, col = Col, lighting = list(exponent = 50))
 surf3D(x, y, z, box = FALSE, col = Col, lighting = list(sr = 1)) 

## =======================================================================
## Shading, lighting with default colors
## =======================================================================

 x <- seq(-pi, pi, len = 100)
 y <- seq(-pi, pi, len = 100)
 grid <- mesh(x, y)

 z    <- with(grid, cos(x) * sin(y))
 cv   <- with(grid, -cos(y) * sin(x))

# lphi = 180, ltheta = -130  - good for shade
# lphi = 90, ltheta = 0  - good for lighting

 par(mfrow = c(2, 2))
 persp3D(z = z, x = x, y = y, colvar = cv, zlim = c(-3, 3), colkey = FALSE)
 persp3D(z = z, x = x, y = y, colvar = cv, zlim = c(-3, 3), 
       lighting = TRUE, colkey = FALSE)
 persp3D(z = z, x = x, y = y, colvar = cv, zlim = c(-3, 3), 
       shade = 0.25, colkey = FALSE)
 persp3D(z = z, x = x, y = y, colvar = cv, zlim = c(-3, 3), 
       lighting = TRUE, lphi = 90, ltheta = 0, colkey = FALSE)

## =======================================================================
## transparency of a vector of colors
## =======================================================================

 par(mfrow = c(1, 1))
 x <- runif(19)
 y <- runif(19)
 z <- runif(19)
# split into 5 sections (polygons) 
 ii <- seq(4, 19, by = 4)
 x[ii] <- y[ii] <- z[ii] <- NA
  
 polygon3D(x, y, z, border = "black", lwd = 2, 
   col = alpha.col(c("red", "lightblue", "yellow", "green", "black"), 
                  alpha = 0.4))

# the same, now passing alpha as an argument to polygon3D:
## Not run: 
##D  polygon3D(x, y, z, border = "black", lwd = 2, 
##D    col = c("red", "lightblue", "yellow", "green", "black"), 
##D                   alpha = 0.4)
## End(Not run)
# reset plotting parameters
 par(mfrow = pm)
 par(mar = pmar)



