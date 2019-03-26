library(plot3D)


### Name: 3-D arrows, segments, polygons, boxes, rectangles
### Title: Plots arrows, segments, points, lines, polygons, rectangles and
###   boxes in a 3D perspective plot or in 2D.
### Aliases: arrows3D segments3D box3D border3D rect3D polygon3D arrows2D
###   segments2D rect2D polygon2D
### Keywords: hplot

### ** Examples

# save plotting parameters
  pm <- par("mfrow")

## ========================================================================
## arrows, points, segments, box
## ========================================================================

# Create a grid of x, y, and z values
 xx <- yy <- seq(-0.8, 0.8, by = 0.2)
 zz <- seq(-0.8, 0.8, by = 0.8)

 M <- mesh(xx, yy, zz)
 x0 <- M$x; y0 <- M$y; z0 <- M$z
 x1 <- x0 + 0.1

 Col <- c("red", "blue", "green") 
 arrows3D(x0, y0, z0, x1 = x1, colvar = z0, lwd = 2, 
          d = 2, clab = "z-value", col = Col, length = 0.1,
          xlim = c(-0.8, 0.8), ylim = c(-0.8, 0.8),
          main = "arrows3D, points3D, segments3D, border3D")

# add starting point of arrows
 points3D(x0, y0, z0, add = TRUE, colvar = z0, 
           colkey = FALSE, pch = ".", cex = 3, col = Col)

# use segments to add section
 x0 <- c(-0.8, 0.8,  0.8, -0.8)
 x1 <- c( 0.8, 0.8, -0.8, -0.8)
         
 y0 <- c(-0.8, -0.8, 0.8, -0.8)
 y1 <- c(-0.8,  0.8, 0.8, 0.8)

 z0 <- c(0., 0., 0., 0.)
 segments3D(x0, y0, z0, x1, y1, z1 = z0,
     add = TRUE, col = "black", lwd = 2)

# add a box 
 border3D(-0.8, -0.8, -0.8, 0.8, 0.8, 0.8,
       col = "orange", add = TRUE, lwd = 3)

## ========================================================================
## boxes, cubes
## ========================================================================

# borders are boxes without facets  
 border3D(x0 = seq(-0.8, -0.1, by = 0.1), 
       y0 = seq(-0.8, -0.1, by = 0.1),
       z0 = seq(-0.8, -0.1, by = 0.1),
       x1 = seq(0.8, 0.1, by = -0.1),
       y1 = seq(0.8, 0.1, by = -0.1),
       z1 = seq(0.8, 0.1, by = -0.1),
       col = gg.col(8), lty = 2, 
       lwd = c(1, 4), phi = 20, main = "border3D")

 box3D(x0 = -0.8, y0 = -0.8, z0 = -0.8, 
       x1 = 0.8, y1 = 0.8, z1 = 0.8, 
       border = "black", lwd = 2, 
       col = gg.col(1, alpha = 0.8), 
       main = "box3D")

 box3D(x0 = seq(-0.8, -0.1, by = 0.1), 
       y0 = seq(-0.8, -0.1, by = 0.1),
       z0 = seq(-0.8, -0.1, by = 0.1),
       x1 = seq(0.8, 0.1, by = -0.1),
       y1 = seq(0.8, 0.1, by = -0.1),
       z1 = seq(0.8, 0.1, by = -0.1),
       col = rainbow(n = 8, alpha = 0.1), 
       border = "black", lwd = 2, phi = 20)

# here the perspective does not always work 
# use alpha.col to set the transparency of a vector of colors
 box3D(x0 = runif(3), y0 = runif(3), z0 = runif(3),
       x1 = runif(3), y1 = runif(3), z1 = runif(3),
       col = c("red", "lightblue", "orange"), alpha = 0.5,
       border = "black", lwd = 2)

## ========================================================================
## rectangles
## ========================================================================
# at constant 'z'
 rect3D(x0 = seq(-0.8, -0.1, by = 0.1),
        y0 = seq(-0.8, -0.1, by = 0.1),
        z0 = seq(-0.8, -0.1, by = 0.1),
        x1 = seq(0.8, 0.1, by = -0.1),
        y1 = seq(0.8, 0.1, by = -0.1),
        col = gg.col(8), border = "black",
        bty = "g", lwd = 2, phi = 20, main = "rect3D")

# constant y and with transparent facets
 rect3D(x0 = 0, y0 = 0, z0 = 0, x1 = 1, z1 = 5,
        ylim = c(0, 1), facets = NA, border = "red",
        bty = "g", lwd = 2, phi = 20)

# add rect at constant z, with colored facet
 rect3D(x0 = 0, y0 = 0, z0 = 0, x1 = 1, y1 = 1,
        border = "red", add = TRUE)

## ========================================================================
## arrows added to a persp plot 
## ========================================================================

 x <- y <- seq(-10, 10, length = 30)
 z <- outer(x, y, FUN = function(x,y) x^2 + y^2)

 persp3D(x, y, z, theta = 30, phi = 30, 
         col = "lightblue", ltheta = 120, shade = 0.75, 
         ticktype = "detailed", xlab = "X", 
         ylab = "Y", zlab = "x^2+y^2" )  

# Points where to put the arrows
 x <- y <- seq(-10, 10, len = 6)
 X0 <- outer(x, y, FUN = function (x,y) x)
 Y0 <- outer(x, y, FUN = function (x,y) y)
 Z0 <- outer(x, y, FUN = function (x,y) x^2 + y^2)

 X1 <- X0 + 1
 Y1 <- Y0 + 1
 Z1 <- Z0 + 10

 arrows3D(X0, Y0, Z0, X1, Y1, Z1, lwd = 2, 
         add = TRUE, type = "curved", col = "red")

 segments3D(X0, Y0, Z0, X0, Y0, rep(0, length(X0)), lwd = 2, 
         add = TRUE, col = "green")

## ========================================================================
## polygon3D 
## ========================================================================

 x <- runif(10)
 y <- runif(10)
 z <- runif(10)
 
 polygon3D(x, y, z)

# several polygons, separated by NAs
 x <- runif(39) 
 y <- runif(39)
 z <- runif(39)
 ii <- seq(4, 36, by  = 4)
 x[ii] <- y[ii] <- z[ii] <- NA 

# transparent colors (alpha)
 polygon3D(x, y, z, border = "black", lwd = 3,
   col = gg.col(length(ii) + 1, alpha = 0.8), 
   main = "polygon3D")

## ========================================================================
## 2D examples, with color key
## ========================================================================

arrows2D(x0 = runif(10), y0 = runif(10),
         x1 = runif(10), y1 = runif(10), colvar = 1:10, 
         code = 3, main = "arrows2D, segments2D")

segments2D(x0 = runif(10), y0 = runif(10),
         x1 = runif(10), y1 = runif(10), colvar = 1:10, 
         lwd = 2, add = TRUE, colkey = FALSE) 

# transparency
rect2D(x0 = runif(10), y0 = runif(10),
       x1 = runif(10), y1 = runif(10), colvar = 1:10, 
       alpha = 0.4, lwd = 2, main = "rect2D") 

## ========================================================================
## polygon2D 
## ========================================================================

 x <- runif(10)
 y <- runif(10)
 
 polygon2D(x, y)    # same as polygon

# several polygons, separated by NAs
 x <- runif(59) 
 y <- runif(59)

 ii <- seq(5, 55, by  = 5)
 x[ii] <- y[ii] <- NA 

# transparent colors (alpha)
 polygon2D(x, y, border = "black", lwd = 3,
   colvar = 1:(length(ii) + 1), 
   col = gg.col(), alpha = 0.2,
   main = "polygon2D")

# restore plotting parameters
 par(mfrow = pm)




