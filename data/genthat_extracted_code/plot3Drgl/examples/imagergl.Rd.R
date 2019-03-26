library(plot3Drgl)


### Name: image2Drgl
### Title: 2-D image, contour, scatterplots, segments and arrows in rgl.
### Aliases: image2Drgl contour2Drgl scatter2Drgl lines2Drgl points2Drgl
###   text2Drgl arrows2Drgl segments2Drgl rect2Drgl
### Keywords: hplot

### ** Examples


## =======================================================================
## image and points
## =======================================================================
 image2Drgl(z = volcano, contour = TRUE, main = "volcano")
 scatter2Drgl(x = seq(0, 1, by = 0.2), y = seq(0, 1, by = 0.2), 
   cex = 3, add = TRUE)

## Not run: 
##D   cutrgl()    # select a rectangle
##D   uncutrgl()
## End(Not run)

## =======================================================================
## scatter points, and lines
## =======================================================================

 scatter2Drgl(cars[,1], cars[,2], xlab = "speed", ylab = "dist")
## Not run: 
##D   cutrgl()
## End(Not run)
 lc <- lowess(cars)
 scatter2Drgl(lc$x, lc$y, type = "l", add = TRUE, lwd = 4)
## Not run: 
##D   cutrgl()
##D   uncutrgl()
## End(Not run)

## =======================================================================
## confidence intervals
## =======================================================================
 x  <- sort(rnorm(10)) 
 y  <- runif(10)
 cv <- sqrt(x^2 + y^2)

 CI <- list(lwd = 2)
 CI$x <- matrix (nrow = length(x), data = c(rep(0.125, 2*length(x))))
 scatter2D(x, y, colvar = cv, pch = 16, cex = 2, CI = CI)

 scatter2Drgl(x, y, colvar = cv, cex = 2, CI = CI)
 
## =======================================================================
## arrows
## =======================================================================

 arrows2Drgl(x0 = 100*runif(30), y0 = runif(30), x1 = 100*runif(30), 
    y1 = runif(30), length = 0.1*runif(30), col = 1:30, angle = 15:45, 
    type = c("simple", "triangle"), lwd = 2)

 x0 <- 1:30
 x1 <- 2:31
 arrows2Drgl(x0 = x0, y0 = sin(x0), x1 = x1, y1 = sin(x1), 
   colvar = x1, lwd = 2)



