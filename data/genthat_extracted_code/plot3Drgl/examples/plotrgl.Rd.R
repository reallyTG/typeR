library(plot3Drgl)


### Name: plotrgl
### Title: Plot 3D graphs in rgl window.
### Aliases: plotrgl
### Keywords: hplot

### ** Examples

# save plotting parameters
 pm <- par("mfrow")
 pmar <- par("mar")

## =======================================================================
## Composite image and contour in 3D
## =======================================================================
# plot reduced resolution (for speed) volcano to traditional window: 
 VV <- volcano[seq(1, nrow(volcano), by = 3), seq(1, ncol(volcano), by = 3)]
 persp3D(z = VV, contour = list(side = "zmax"))

 plotrgl(new = TRUE) # new window

# add light, smooth surface change x-axis limits 
 plotrgl(new = FALSE, lighting = TRUE, 
   xlim = c(0.2, 0.8), smooth = TRUE)

# same:
# persp3Drgl(z = volcano, contour = list(side = "zmax"), 
#  lighting = TRUE, xlim = c(0.2, 0.8), smooth = TRUE)
  
## =======================================================================
## scatters with fitted surface and droplines (see ?scatter3D)
## =======================================================================

 par (mfrow = c(1, 1))
 with (mtcars, {

  # linear regression
   fit <- lm(mpg ~ wt + disp)

  # predict values on regular xy grid
   wt.pred <- seq(1.5, 5.5, length.out = 30)
   disp.pred <- seq(71, 472, length.out = 30)
   xy <- expand.grid(wt = wt.pred, 
                     disp = disp.pred)

   mpg.pred <- matrix (nrow = 30, ncol = 30, 
      data = predict(fit, newdata = data.frame(xy), 
      interval = "prediction"))

# fitted points for droplines to surface
   fitpoints <- predict(fit) 

   scatter3D(z = mpg, x = wt, y = disp, pch = 18, cex = 2, 
      theta = 20, phi = 20, ticktype = "detailed",
      xlab = "wt", ylab = "disp", zlab = "mpg",  
      surf = list(x = wt.pred, y = disp.pred, z = mpg.pred, 
                  facets = NA, fit = fitpoints),
      main = "mtcars")
  
 })

 plotrgl()
 
## =======================================================================
## scatter3D with text
## =======================================================================
 
 with(USArrests, text3D(Murder, Assault, Rape,
    colvar = UrbanPop, col = gg.col(100), theta = 60, phi = 20,
    xlab = "Murder", ylab = "Assault", zlab = "Rape",
    main = "USA arrests",
    labels = rownames(USArrests), cex = 0.8,
    bty = "g", ticktype = "detailed", d = 2,
    clab = c("Urban","Pop"), adj = 0.5, font = 2))

 with(USArrests, scatter3D(Murder, Assault, Rape - 1,
    colvar = UrbanPop, col = gg.col(100),
    type = "h", pch = ".", add = TRUE))

 plotrgl()


## =======================================================================
## spheresurf3D
## =======================================================================

 AA <- Hypsometry$z

# log transformation of color variable; full = TRUE to plot both halves
 spheresurf3D(AA, theta = 90, phi = 30, box = FALSE,
    full = TRUE, plot = FALSE) 

# change the way the left mouse reacts
 plotrgl(mouseMode = c("zAxis", "zoom", "fov"))

## =======================================================================
## Arrows - has a flaw
## =======================================================================

 z <- seq(0, 2*pi, length.out = 100) 
 x <- cos(z)
 y <- sin(z)

 z0 <- z[seq(1, by = 10, length.out = 10)]
 z1 <- z[seq(9, by = 10, length.out = 10)]

# cone arrow heads
 arrows3D(x0 = 10*cos(z0), y0 = sin(z0), z0 = z0,
          x1 = 10*cos(z1), y1 = sin(z1), z1 = z1, 
          type = "cone", length = 0.4, lwd = 4,
          angle = 20, col = 1:10, plot = FALSE)

 plotrgl(lighting = TRUE)

## =======================================================================
## 2D plot
## =======================================================================

 image2D(z = volcano)
 plotrgl()
 
# reset plotting parameters 
 par(mfrow = pm)
 par(mar = pmar)




