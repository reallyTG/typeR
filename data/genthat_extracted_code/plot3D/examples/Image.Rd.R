library(plot3D)


### Name: 2D image and contour plots
### Title: Extended image and contour plots for 2-D (and 3-D) data.
### Aliases: image2D contour2D image2D.matrix image2D.array image2D.list
### Keywords: hplot

### ** Examples

# save plotting parameters
 pm <- par("mfrow")

## =======================================================================
## Difference between x or y a vector/matrix and rasterImage
## =======================================================================

 par(mfrow = c(2, 2))
 x <- y <- 1:3
 z <- matrix (nrow = 3, ncol = 3, data = 1:9)
 image2D(z, x, y, border = "black")
 image2D(z, x, y, rasterImage = TRUE, border = "black")
 image2D(z, x = matrix(nrow = 3, ncol = 3, data = x), 
       y, border = "black")
 image2D(z, x, y, border = "black", theta = 45)

## =======================================================================
## shading, light, adding contours, points and lines
## =======================================================================

 par(mfrow = c(2, 2))
 nr <- nrow(volcano)
 nc <- ncol(volcano)

 image2D(volcano, x = 1:nr, y = 1:nc, lighting = TRUE, 
       main = "volcano", clab = "height, m")

 abline(v = seq(10, 80, by = 10))
 abline(h = seq(10, 60, by = 10))
 points(50, 30, pch = 3, cex = 5, lwd = 3, col = "white")

 image2D(z = volcano, x = 1:nr, y = 1:nc, lwd = 2, shade = 0.2,
       main = "volcano", clab = "height, m")

 image2D(volcano, x = 1:nr, y = 1:nc, contour = TRUE, shade = 0.5, lphi = 0,
       col = "lightblue", main = "volcano")

 breaks <- seq(90, 200, by = 10)
 image2D(volcano, x = 1:nr, y = 1:nc, col = jet.col(length(breaks)-1),
       main = "volcano", clab = "height, m", breaks = breaks)

## =======================================================================
## Contour plots
## =======================================================================

 par(mfrow = c(2, 2))
 V <- volcano - 150
 
# default, no color key
 contour2D(z = V, colkey = FALSE, lwd = 2)

# imposed levels
 contour2D(z = V, lwd = 2, levels = seq(-40, 40, by = 20))

# negative levels dashed
 contour2D(z = V, col = "black", lwd = 2, 
           levels = seq(0, 40, by = 20))
 contour2D(z = V, col = "black", lwd = 2, lty = 2, 
           levels = seq(-40, -20, by = 20), add = TRUE)

# no labels, imposed number of levels, colorkey
 contour2D(z = V, lwd = 2, nlevels = 20, drawlabels = FALSE, 
           colkey = list(at = seq(-40, 40, by = 20)))

## =======================================================================
## A large data set, input is an array
## =======================================================================

 par(mfrow = c(1, 1))
 image2D(z = Oxsat$val[, , 1], x = Oxsat$lon, y = Oxsat$lat,
       main = "surface oxygen saturation data 2005", NAcol = "black", 
       clab = c("","","%"))

# images at first 9 depths - use subset to select them
 image2D(z = Oxsat$val, subset = 1:9, 
       x = Oxsat$lon, y = Oxsat$lat,
       margin = c(1, 2), NAcol = "black", 
       xlab = "longitude", ylab = "latitude", 
       zlim = c(0, 115),
       main = paste("depth ", Oxsat$depth[1:9], " m"),
       mfrow = c(3, 3))

# images at latitude - depth section - increase resolution
 z <- Oxsat$val[,  Oxsat$lat > - 5 & Oxsat$lat < 5, ]
 image2D(z = z, x = Oxsat$lon, y = Oxsat$depth,
       margin = c(1, 3), NAcol = "black", 
       resfac = 3, ylim = c(5000, 0))
  
# show position of transects 
 image2D(z = Oxsat$val[ , ,1], 
       x = Oxsat$lon, y = Oxsat$lat,
       NAcol = "black")
 abline(h = Oxsat$lat[Oxsat$lat > - 5 & Oxsat$lat < 5])      

## =======================================================================
## Image of a list of matrices
## =======================================================================

 listvolcano <- list(volcano = volcano, logvolcano = log(volcano)) 
 image2D(listvolcano, x = 1:nr, y = 1:nc, contour = TRUE,
       main = c("volcano", "log(volcano)"), 
       clab = list("height, m", "log(m)"),
       zlim = list(c(80, 200), c(4.4, 5.5)))

## =======================================================================
## Image of a list of arrays
## =======================================================================

## Not run: 
##D # crude conversion from oxsat to oxygen 
##D  listoxygen <- list(Oxsat$val, Oxsat$val/100 * 360)
##D   
##D  image2D(z = listoxygen, 
##D        x = Oxsat$lon, y = Oxsat$lat,
##D        margin = c(1, 2), NAcol = "black", 
##D        main = c("Oxygen saturation ", " Oxygen concentration"),
##D        mtext = paste("depth ", Oxsat$depth, " m")
##D        )
## End(Not run)

## =======================================================================
## 'x', 'y' and 'z' are matrices
## =======================================================================

 par(mfrow = c(2, 1))

# tilted x- and y-coordinates of 'volcano'
 volcx <- matrix(nrow = 87, ncol = 61, data = 1:87)
 volcx <- volcx + matrix(nrow = 87, ncol = 61, 
        byrow = TRUE, data = seq(0., 15, length.out = 61))

 volcy <- matrix(ncol = 87, nrow = 61, data = 1:61)
 volcy <- t(volcy + matrix(ncol = 87, nrow = 61, 
        byrow = TRUE, data = seq(0., 25, length.out = 87)))

 image2D(volcano, x = volcx, y = volcy)

# x and y can also be of dimension dim(z)+1:
## Not run: 
##D # tilted x- and y-coordinates of 'volcano'
##D  volcx <- matrix(nrow = 88, ncol = 62, data = 1:88)
##D  volcx <- volcx + matrix(nrow = 88, ncol = 62,
##D         byrow = TRUE, data = seq(0., 15, length.out = 62))
##D 
##D  volcy <- matrix(ncol = 88, nrow = 62, data = 1:62)
##D  volcy <- t(volcy + matrix(ncol = 88, nrow = 62,
##D         byrow = TRUE, data = seq(0., 25, length.out = 88)))
##D 
##D  image2D(volcano, x = volcx, y = volcy)
## End(Not run)

# use of panel function
 image2D(volcano, x = volcx, y = volcy, NAcol = "black", 
       panel.first = substitute(box(col = "lightgrey", lwd = 30)))
                                    
## =======================================================================
## Image with NAs and logs
## =======================================================================

 par(mfrow = c(2, 2))
# normal volcano
 image2D(volcano, clab = c("height", "m"))

# logarithmic z-axis
 image2D(volcano, log = "z", clab = c("height", "m"),
     main = "log='z'")

# Including NAs
 VOLC <- volcano - 110
 VOLC [VOLC <= 0] <- NA
 image2D(VOLC, main = "including NAs and rescaled")

# both
 image2D(VOLC, NAcol = "black", log = "z", zlim = c(1, 100),
     main = "NAs and log = 'z'")

## =======================================================================
## Image with contour specification (alpha sets the transparency)
## =======================================================================

 par(mfrow = c(1, 1))
 image2D(volcano, shade = 0.2, rasterImage = TRUE,
   contour = list(col = "white", labcex = 0.8, lwd = 3, alpha = 0.5))
# same:
## Not run: 
##D  image2D(z = volcano, shade = 0.2, rasterImage = TRUE)
##D  contour2D(z = volcano, col = "white", labcex = 0.8, 
##D    lwd = 3, alpha = 0.5, add = TRUE)
## End(Not run)
# reset plotting parameters
 par(mfrow = pm)



