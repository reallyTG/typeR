library(OceanView)


### Name: Quiver and flow paths
### Title: Plots velocities as arrows or as trajectory plots.
### Aliases: quiver2D quiver2D.matrix quiver2D.array quiver2Drgl flowpath
### Keywords: hplot

### ** Examples

## =======================================================================
##  EXAMPLE 1: 
## =======================================================================
 pm <- par("mfrow")
 par(mfrow = c(2, 2))

# generate velocities
 x  <- seq(-1, 1, by = 0.2)
 y  <- seq(-1, 1, by = 0.2)
 dx <- outer(x, y , function(x, y) -y)
 dy <- outer(x, y , function(x, y) x)

# velocity plot, with legend
 F <- quiver2D(u = dx, v = dy, x = x, y = y)
 legend("topright", bg = "white", 
   legend = paste("max = ", format(F$speed.max, digits = 2))) 

# different color for up/downward pointing arrows
 quiver2D(u = dx, v = dy, x = x, y = y, colvar = dx > 0, 
        col = c("red", "blue"), colkey = FALSE,
        arr.max = 0.4, arr.min = 0.1)

# different scale
 quiver2D(u = dx, v = dy, x = x, y = y, by = 2, scale = 2)

# three flow paths
 flowpath(u = dx, v = dy, x = x, y = y, startx = 0.1, starty = 0.1)
 flowpath(u = dx, v = dy, x = x, y = y, 
          startx = c(0.9, -0.9), starty = c(0.0, 0.0), col = "red",
          numarr = 2, add = TRUE)

## =======================================================================
##  EXAMPLE 2: note: has changed in version 1.0.3 - uses contour2D!
## =======================================================================
 par(mfrow = c(1, 1))
 x <- seq(-2, 2, by = 0.2)
 y <- seq(-1, 1, by = 0.2)
 z <- outer (x, y, function(x, y) x^3 - 3*x -2*y^2)
 contour2D(x, y, z = z, col = jet.col(10))

# gradients in x- and y-direction (analytical)
 dX <- outer(x, y, function(x,y) 3*x^2 - 3)
 dY <- outer(x, y, function(x,y) -4*y)

 quiver2D(u = dX, v = dY, x = x, y = y, scale = 1, add = TRUE, by = 1)
 flowpath(u = dX, v = dY, x = x, y = y, startx = c(-2, 1.1), 
            starty = c(-1, -1), add = TRUE, arr.length = 0.5,
            col = "darkgreen", lwd = 3, numarr = 1)

## =======================================================================
##  EXAMPLE 3: 
## =======================================================================
 
 x <- y <- 1:20
 u <- outer (x, y, function (x, y) cos(2*pi*y/10))
 v <- outer (x, y, function (x, y) cos(2*pi*x/10))

 quiver2D(x = x, y = y, u = u, v = v, col = "grey")

# flowpaths using all combinations of x and y at edges
 flowpath(x = x, y = y, u = u, v = v, add = TRUE, 
          lwd = 2, col = "orange")

## =======================================================================
##  EXAMPLE 4: quiver of an array.. 
## =======================================================================
 
 x <- y <- 1:20
 u2 <- outer (x, y, function (x, y) sin(2*pi*y/10))
 v2 <- outer (x, y, function (x, y) sin(2*pi*x/10))

# merge u, u2 and v, v2 to create an "array"
 U <- array(dim = c(dim(u2), 2), data = c(u, u2))
 V <- array(dim = c(dim(v2), 2), data = c(v, v2))

 quiver2D(u = U, v = V, x = x, y = y, main = c("time 1", "time 2"))

# quiver over x and time, for a subset of y-values:
 quiver2D(u = U, v = V, x = x, y = 1:2, 
        margin = c(1, 3), main = paste("y ", y), 
        subset = y <= 4)

## Not run: 
##D  quiver2D(u = U, v = V, x = x, y = y, ask = TRUE, 
##D         mfrow = c(1, 1))
##D 
##D  quiver2D(u = U, v = V, x = x, y = 1:2, ask = TRUE, 
##D         margin = c(1, 3), main = paste("y ", y),
##D         mfrow = c(1, 1))
##D 
## End(Not run)

## =======================================================================
##  EXAMPLE 5: 
## =======================================================================
 par(mfrow = c(1, 1))

 image2D(x = 1:nrow(volcano), y = 1:ncol(volcano), 
       z = volcano, contour = TRUE)

# Assume these are streamfunctions, we calculate the velocity field as:
 dx <- dy <- 1
 v <-   (volcano[-1, ] - volcano[-nrow(volcano), ] )/dx
 u <- - (volcano[, -1] - volcano[ ,-ncol(volcano)] )/dy

 quiver2D(x = 1:nrow(u), y = 1:ncol(v), 
        u = u, v = v, add = TRUE, by = 3)
 
 flowpath(x = 1:nrow(u), y = 1:ncol(v), numarr = 10,
          u = u, v = v, add = TRUE, lwd = 2, col = "grey", 
          startx = 20, starty = 30)
 
## =======================================================================
##  EXAMPLE 6: boundary mask, images, contours
## =======================================================================
 par (mfrow = c(2, 2))
 
 mask <- volcano; mask[volcano < 120]  <- NA
 quiver2D(by = c(3, 2), u = u, v = v, mask = mask)

 quiver2D(by = c(3, 2), u = u, v = v,  
        image = list(z = mask, NAcol = "black"))

 quiver2D(by = c(4, 3), u = u, v = v,
        contour = list(z = volcano, lwd = 2))

 quiver2D(by = c(4, 3), u = u, v = v, 
        contour = list(z = volcano, col = "black"), 
        image = list(z = volcano, NAcol = "black"))

## =======================================================================
##  Same in rgl
## =======================================================================
## Not run: 
##D  quiver2Drgl(by = c(3, 2), u = u, v = v, mask = mask, NAcol = "black")
##D 
##D  quiver2Drgl(by = c(3, 2), u = u, v = v,  
##D         image = list(z = volcano, NAcol = "black"))
##D 
##D  quiver2Drgl(by = c(4, 3), u = u, v = v, scale = 2,
##D         contour = list(z = volcano, lwd = 2))
##D 
##D  quiver2Drgl(by = c(4, 3), u = u, v = v, 
##D         contour = list(z = volcano, col = "black"), 
##D         image = list(z = volcano, NAcol = "black"))
##D  cutrgl()
##D  uncutrgl()
## End(Not run)

## =============================================================================
## 2-D Data set SyltSurf
## =============================================================================

 par(mfrow = c(1, 1))
 with (Syltsurf,
   quiver2D(x = x, y = y, u = u[ , ,2], v = v[ , ,2], 
     xlim = c(5, 20), ylim = c(10, 25), by = 3, 
     main = paste(formatC(time[1]), " hr"), scale = 1.5, 
     image = list(z = depth, x = x, y = y, NAcol = "black", 
                  colkey = TRUE), 
     contour = list(z = depth, x = x, y = y, col = "black",
       drawlabels = FALSE)
     )
  )

## =============================================================================
## 2-D Data set SyltSurf, several time points
## =============================================================================

# now for an array (first and 4th time point only)
 ii <- c(1, 4)
 with (Syltsurf,
   quiver2D(x = x, y = y, u = u[ ,,ii], v = v[ ,,ii], 
     xlim = c(5, 20), ylim = c(10, 25), by = 4, 
     mask = list(z = depth, x = x, y = y, NAcol = "blue"),
     main = paste(formatC(time[ii]), " hr"), scale = 1.5,
     contour = list(z = depth, x = x, y = y, drawlabels = FALSE)
     )
  )



## =============================================================================
## Adding quivers ...
## =============================================================================
x <- 1:2
y <- 1:3
u <- matrix(1:6,2,3)
v <- matrix(6:1,2,3)
 par(mfrow = c(1, 1))

A <- quiver2D(x = x, y = y, u = u, v = v)
B <- quiver2D(x = x, y = y[-1], u = u[,-1], v = v[,-1], col = 2, add = TRUE)
C <- quiver2D(x = x, y = y[-3], u = u[,-3], v = v[,-3], col = 3, add = TRUE)

# restore parameter settings
 par(mfrow = pm)



