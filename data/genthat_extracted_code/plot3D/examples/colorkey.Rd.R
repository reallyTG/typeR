library(plot3D)


### Name: Color key legend
### Title: Plots a color legend
### Aliases: colkey
### Keywords: hplot

### ** Examples

# save plotting parameters
 pm <- par(mfrow = c(2, 2))
 pmar <- par(mar = c(5.1, 4.1, 4.1, 2.1))

## =======================================================================
##  colorkey as argument of a plot3D function
## =======================================================================
# default, colkey = NULL: adds colkey because multiple colors
 image2D(z = volcano)  

# default, colkey = NULL: no colkey because only one color
 image2D(z = volcano, col = "grey", shade = 0.2, contour = TRUE)  

# colkey = FALSE: no color key, no extra space foreseen
 image2D(z = volcano, colkey = FALSE)
 
# colkey = list(plot = FALSE): no color key, extra space foreseen
 image2D(z = volcano, colkey = list(plot = FALSE, side = 3))
 colkey (side = 3, add = TRUE, clim = range(volcano))
 
 
## =======================================================================
##  colorkey in new plot
## =======================================================================
 
 colkey(side = 1, clim = c(0, 1), add = FALSE, clab = "z", 
   col.clab = "red", adj.clab = 0)
 colkey(side = 2, clim = c(0, 1), clab = "z", length = 0.5, width = 0.5)
 colkey(side = 3, clim = c(0, 1), lwd = 3, clab = c("a","b","c","d"), 
   line.clab = 5)
 colkey(side = 4, clim = c(1e-6, 1), clog = TRUE, 
   clab = "a very long title in bold and close to the key", 
   line.clab = 1, side.clab = 2, font.clab = 2)

## =======================================================================
##  colorkey added to existing plot
## =======================================================================

 par(mfrow = c(1, 1))

 image2D(volcano, xlab = "", clab = "m", 
       colkey = list(side = 1, length = 0.5, width = 0.5, 
         line.clab = 1))
 colkey(side = 3, clim = range(volcano), add = TRUE)

# 'dist' to put colkey within the image 
# 'shift' to position colkey to the right or upward
 par(mfrow = c(1, 1))
 image2D(volcano, colkey = FALSE)

 colkey(clim = range(volcano), dist = -0.15, shift = 0.2,
        side = 3, add = TRUE, clab = "key 1", col.clab = "white",
        length = 0.5, width = 0.5, col.axis = "white", 
        col.ticks = "white", cex.axis = 0.8)

 colkey(clim = range(volcano), dist = -0.1, shift = -0.2,
        side = 4, add = TRUE, clab = "key 2", col.clab = "white",
        length = 0.3, width = 0.5, col.axis = "white", 
        col.ticks = "white", col.box = "red", cex.axis = 0.8)

 colkey(clim = range(volcano), dist = -0.3, 
        side = 1, add = TRUE, clab = "key 3", col.clab = "white",
        length = 0.3, width = 0.5, col.axis = "white", 
        col.ticks = "white", at  = c(100, 140, 180), 
        labels = c("a", "b", "c"), font = 2)

 colkey(clim = range(volcano), dist = -0.3, shift = -0.2,
        side = 2, add = TRUE, clab = "key 4", col.clab = "white",
        length = 0.3, width = 0.5, col.axis = "white", 
        col.ticks = "white", col.box = "red", cex.axis = 0.8,
        las = 3)

## =======================================================================
##  colorkey in other plots
## =======================================================================

 par(mfrow = c(1, 1))
 par(mar = par("mar") + c(0, 0, -2, 0))
 image2D(volcano, clab = "height, m", 
       colkey = list(dist = -0.15, shift = 0.2,
       side = 3, length = 0.5, width = 0.5, line.clab = 2.5,
       cex.clab = 2, col.clab = "white", col.axis = "white", 
       col.ticks = "white", cex.axis = 0.8))

## =======================================================================
## Several color keys in composite plot
## =======================================================================

 persp3D(z = volcano, zlim = c(-60, 200), phi = 20, bty = "b",   
    colkey = list(length = 0.2, width = 0.4, shift = 0.15,
      cex.axis = 0.8, cex.clab = 0.85), lighting = TRUE, lphi = 90,
    clab = c("height","m"), plot = FALSE)

# create gradient in x-direction
 Vx <- volcano[-1, ] - volcano[-nrow(volcano), ]

# add as image with own color key, at bottom 
 image3D(z = -60, colvar = Vx/10, add = TRUE, 
    colkey = list(length = 0.2, width = 0.4, shift = -0.15,
      cex.axis = 0.8, cex.clab = 0.85),
   clab = c("gradient","m/m"), plot = TRUE)

## =======================================================================
## categorical colors; use addlines = TRUE to separate colors
## =======================================================================

 with(iris, scatter3D(x = Sepal.Length, y = Sepal.Width, 
   z = Petal.Length, colvar = as.integer(Species), 
   col = c("orange", "green", "lightblue"), pch = 16, cex = 2,  
   clim = c(1, 3), ticktype = "detailed", phi = 20,
   xlab = "Sepal Length", ylab = "Sepal Width", 
   zlab = "Petal Length",  main = "iris",
   colkey = list(at = c(1.33, 2, 2.66), side = 1, 
   addlines = TRUE, length = 0.5, width = 0.5,
   labels = c("setosa", "versicolor", "virginica") )))

# reset plotting parameters
 par(mfrow = pm)
 par(mar = pmar)



