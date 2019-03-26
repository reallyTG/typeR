library(plot3D)


### Name: Scatter plots
### Title: Colored scatter plots and text in 2-D and 3-D
### Aliases: scatter3D text3D points3D lines3D scatter2D points2D lines2D
###   text2D
### Keywords: hplot

### ** Examples

# save plotting parameters
 pm <- par("mfrow")

 
## =======================================================================
## A sphere 
## =======================================================================

 par(mfrow = c(1, 1))
 M  <- mesh(seq(0, 2*pi, length.out = 100), 
            seq(0,   pi, length.out = 100))
 u  <- M$x ; v  <- M$y

 x <- cos(u)*sin(v)
 y <- sin(u)*sin(v)
 z <- cos(v)

# full  panels of box are drawn (bty = "f")
 scatter3D(x, y, z, pch = ".", col = "red", 
           bty = "f", cex = 2, colkey = FALSE)

## =======================================================================
## Different types
## =======================================================================

 par (mfrow = c(2, 2))
 z <- seq(0, 10, 0.2)
 x <- cos(z)
 y <- sin(z)*z

# greyish background for the boxtype (bty = "g") 
 scatter3D(x, y, z, phi = 0, bty = "g",
           pch = 20, cex = 2, ticktype = "detailed")
# add another point
 scatter3D(x = 0, y = 0, z = 0, add = TRUE, colkey = FALSE, 
           pch = 18, cex = 3, col = "black")

# add text
 text3D(x = cos(1:10), y = (sin(1:10)*(1:10) - 1), 
        z = 1:10, colkey = FALSE, add = TRUE, 
        labels = LETTERS[1:10], col = c("black", "red"))

# line plot
 scatter3D(x, y, z, phi = 0, bty = "g", type = "l", 
           ticktype = "detailed", lwd = 4)

# points and lines
 scatter3D(x, y, z, phi = 0, bty = "g", type = "b", 
           ticktype = "detailed", pch = 20, 
           cex = c(0.5, 1, 1.5))

# vertical lines
 scatter3D(x, y, z, phi = 0, bty = "g",  type = "h", 
           ticktype = "detailed")

## =======================================================================
## With confidence interval
## =======================================================================

 x <- runif(20)
 y <- runif(20)
 z <- runif(20)

 par(mfrow = c(1, 1))
 CI <- list(z = matrix(nrow = length(x),
                       data = rep(0.05, 2*length(x))))

# greyish background for the boxtype (bty = "g")
 scatter3D(x, y, z, phi = 0, bty = "g", CI = CI,
   col = gg.col(100), pch = 18, cex = 2, ticktype = "detailed",
   xlim = c(0, 1), ylim = c(0, 1), zlim = c(0, 1))

# add new set of points
 x <- runif(20)
 y <- runif(20)
 z <- runif(20)

 CI2 <- list(x = matrix(nrow = length(x),
                       data = rep(0.05, 2*length(x))),
             z = matrix(nrow = length(x),
                       data = rep(0.05, 2*length(x))))

 scatter3D(x, y, z, CI = CI2, add = TRUE, col = "red", pch = 16)

## =======================================================================
## With a surface
## =======================================================================

 par(mfrow = c(1, 1))
 
# surface = volcano
 M <- mesh(1:nrow(volcano), 1:ncol(volcano))

# 100 points above volcano 
 N  <- 100
 xs <- runif(N) * 87
 ys <- runif(N) * 61
 zs <- runif(N)*50 + 154
  
# scatter + surface
 scatter3D(xs, ys, zs, ticktype = "detailed", pch = 16, 
   bty = "f", xlim = c(1, 87), ylim = c(1,61), zlim = c(94, 215), 
   surf = list(x = M$x, y = M$y, z = volcano,  
               NAcol = "grey", shade = 0.1))
 
## =======================================================================
## A surface and CI
## =======================================================================

 par(mfrow = c(1, 1))
 M <- mesh(seq(0, 2*pi, length = 30), (1:30)/100)
 z <- with (M, sin(x) + y)
 
# points 'sampled'
 N <- 30
 xs <- runif(N) * 2*pi
 ys <- runif(N) * 0.3

 zs <- sin(xs) + ys + rnorm(N)*0.3
 
 CI <- list(z = matrix(nrow = length(xs), 
                       data = rep(0.3, 2*length(xs))),
            lwd = 3)
  
# facets = NA makes a transparent surface; borders are black
 scatter3D(xs, ys, zs, ticktype = "detailed", pch = 16, 
   xlim = c(0, 2*pi), ylim = c(0, 0.3), zlim = c(-1.5, 1.5), 
   CI = CI, theta = 20, phi = 30, cex = 2,
   surf = list(x = M$x, y = M$y, z = z, border = "black", facets = NA)
   )

## =======================================================================
## droplines till the fitted surface
## =======================================================================

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

## =======================================================================
## Two ways to make a scatter 3D of quakes data set
## =======================================================================

 par(mfrow = c(1, 1)) 
# first way, use vertical spikes (type = "h")
 with(quakes, scatter3D(x = long, y = lat, z = -depth, colvar = mag, 
      pch = 16, cex = 1.5, xlab = "longitude", ylab = "latitude", 
      zlab = "depth, km", clab = c("Richter","Magnitude"),
      main = "Earthquakes off Fiji", ticktype = "detailed", 
      type = "h", theta = 10, d = 2, 
      colkey = list(length = 0.5, width = 0.5, cex.clab = 0.75))
      )

# second way: add dots on bottom and left panel
# before the scatters are drawn, 
# add small dots on basal plane and on the depth plane
 panelfirst <- function(pmat) {
    zmin <- min(-quakes$depth)
    XY <- trans3D(quakes$long, quakes$lat, 
                  z = rep(zmin, nrow(quakes)), pmat = pmat)
    scatter2D(XY$x, XY$y, colvar = quakes$mag, pch = ".", 
            cex = 2, add = TRUE, colkey = FALSE)
 
    xmin <- min(quakes$long)
    XY <- trans3D(x = rep(xmin, nrow(quakes)), y = quakes$lat, 
                  z = -quakes$depth, pmat = pmat)
    scatter2D(XY$x, XY$y, colvar = quakes$mag, pch = ".", 
            cex = 2, add = TRUE, colkey = FALSE)
 }

 with(quakes, scatter3D(x = long, y = lat, z = -depth, colvar = mag, 
      pch = 16, cex = 1.5, xlab = "longitude", ylab = "latitude", 
      zlab = "depth, km", clab = c("Richter","Magnitude"),
      main = "Earthquakes off Fiji", ticktype = "detailed", 
      panel.first = panelfirst, theta = 10, d = 2, 
      colkey = list(length = 0.5, width = 0.5, cex.clab = 0.75))
      )

## =======================================================================
## text3D and scatter3D
## =======================================================================

 with(USArrests, text3D(Murder, Assault, Rape, 
    colvar = UrbanPop, col = gg.col(100), theta = 60, phi = 20,
    xlab = "Murder", ylab = "Assault", zlab = "Rape", 
    main = "USA arrests", 
    labels = rownames(USArrests), cex = 0.6, 
    bty = "g", ticktype = "detailed", d = 2,
    clab = c("Urban","Pop"), adj = 0.5, font = 2))

 with(USArrests, scatter3D(Murder, Assault, Rape - 1, 
    colvar = UrbanPop, col = gg.col(100), 
    type = "h", pch = ".", add = TRUE))

## =======================================================================
## zoom near origin
## =======================================================================

# display axis ranges
 getplist()[c("xlim","ylim","zlim")] 

# choose suitable ranges
 plotdev(xlim = c(0, 10), ylim = c(40, 150), 
         zlim = c(7, 25))

## =======================================================================
## text3D to label x- and y axis
## =======================================================================

 par(mfrow = c(1, 1))
 hist3D (x = 1:5, y = 1:4, z = VADeaths,
        bty = "g", phi = 20,  theta = -60,
        xlab = "", ylab = "", zlab = "", main = "VADeaths",
        col = "#0072B2", border = "black", shade = 0.8,
        ticktype = "detailed", space = 0.15, d = 2, cex.axis = 1e-9)

 text3D(x = 1:5, y = rep(0.5, 5), z = rep(3, 5),
       labels = rownames(VADeaths),
       add = TRUE, adj = 0)
 text3D(x = rep(1, 4),   y = 1:4, z = rep(0, 4),
       labels  = colnames(VADeaths),
       add = TRUE, adj = 1)

## =======================================================================
## Scatter2D; bty can also be set = to one of the perspbox alernatives
## =======================================================================

 par(mfrow = c(2, 2))
 x <- seq(0, 2*pi, length.out = 30)

 scatter2D(x, sin(x), colvar = cos(x), pch = 16, 
         ylab = "sin", clab = "cos", cex = 1.5)
# other box types:
 scatter2D(x, sin(x), colvar = cos(x), type = "l", lwd = 4, bty = "g")
 scatter2D(x, sin(x), colvar = cos(x), type = "b", lwd = 2, bty = "b2")
# transparent colors and spikes
 scatter2D(x, sin(x), colvar = cos(x), type = "h", lwd = 4, alpha = 0.5)
  
## =======================================================================
## mesh examples and scatter2D
## =======================================================================

 par(mfrow = c(1, 2))
 x <- seq(-1, 1, by = 0.1)
 y <- seq(-2, 2, by = 0.2)

 grid <- mesh(x, y)
 z    <- with(grid, cos(x) * sin(y))
 image2D(z, x = x, y = y)
 points(grid)
 scatter2D(grid$x, grid$y, colvar = z, pch = 20, cex = 2)

## =======================================================================
## scatter plot with confidence intervals
## =======================================================================

 par(mfrow = c(2, 2))
 x  <- sort(rnorm(10)) 
 y  <- runif(10)
 cv <- sqrt(x^2 + y^2)

 CI <- list(lwd = 2)
 CI$x <- matrix (nrow = length(x), data = c(rep(0.25, 2*length(x))))
 scatter2D(x, y, colvar = cv, pch = 16, cex = 2, CI = CI)
 scatter2D(x, y, colvar = cv, pch = 16, cex = 2, CI = CI, type = "b")

 CI$y <- matrix (nrow = length(x), data = c(rep(0.05, 2*length(x))))
 CI$col <- "black"
 scatter2D(x, y, colvar = cv, pch = 16, cex = 2, CI = CI)

 CI$y[c(2,4,8,10), ] <- NA  # Some points have no CI
 CI$x[c(2,4,8,10), ] <- NA  # Some points have no CI
 CI$alen <- 0.02            # increase arrow head
 scatter2D(x, y, colvar = cv, pch = 16, cex = 2, CI = CI)

## =======================================================================
## Scatter on an image
## =======================================================================
 
 par(mfrow = c(1, 1))
# image of oxygen saturation
 oxlim <- range(Oxsat$val[,,1], na.rm  = TRUE) 
 image2D(z = Oxsat$val[,,1], x = Oxsat$lon, y = Oxsat$lat,
       contour = TRUE, 
       xlab = "longitude", ylab = "latitude", 
       main = "Oxygen saturation", clim = oxlim, clab = "%")

# (imaginary) measurements at 5 sites
 lon   <- c( 11.2,   6.0, 0.9,  -4, -8.8)
 lat   <- c(-19.7,-14.45,-9.1,-3.8, -1.5)
 O2sat <- c(   90,    95,  92,  85,  100)
               
# add to image; use same zrange; avoid adding  a color key
 scatter2D(colvar = O2sat, x = lon, y = lat, clim = oxlim, pch = 16,
         add = TRUE, cex = 2, colkey = FALSE)

## =======================================================================
## Scatter on a contourplot
## =======================================================================

 par(mfrow = c(1, 1))

# room for colorkey by setting colkey = list(plot = FALSE)

# contour plot of the ocean's bathymetry
 Depth <- Hypsometry$z
 Depth[Depth > 0] <- NA
 contour2D(z = Depth, x = Hypsometry$x, y = Hypsometry$y, 
       xlab = "longitude", ylab = "latitude", 
       col = "black", NAcol = "grey", levels = seq(-6000, 0, by = 2000),
       main = "Oxygen saturation along ship track", 
       colkey = list(plot = FALSE))

# add data to image; with  a color key
 scatter2D(colvar = O2sat, x = lon, y = lat, pch = 16,
         add = TRUE, cex = 2, clab = "%")

## =======================================================================
## scatter2D for time-series plots
## =======================================================================

# Plotting sunspot 'anomalies'
sunspot <- data.frame(year = time(sunspot.month), 
  anom = sunspot.month - mean(sunspot.month))

# long-term moving average of anomaly
ff <- 100
sunspot$ma <- filter(sunspot$anom, rep(1/ff, ff), sides = 2)

with (sunspot, lines2D(year, anom, 
  colvar = anom > 0, 
  col = c("pink", "lightblue"),
  main = "sunspot anomaly", type = "h", 
  colkey = FALSE, las = 1, xlab = "year", ylab = ""))
lines2D(sunspot$year, sunspot$ma, add = TRUE)  

# The same
#with (sunspot, plot(year, anom, 
#  col = c("pink", "lightblue")[(anom > 0) + 1],
#  main = "sunspot", type = "h", las = 1))

# but this does not work due to NAs...  
# lines(sunspot$year, sunspot$ma)  

## =======================================================================
## text2D
## =======================================================================

 with(USArrests, text2D(x = Murder, y = Assault + 5, colvar = Rape, 
     xlab = "Murder", ylab = "Assault", clab = "Rape", 
     main = "USA arrests", labels = rownames(USArrests), cex = 0.6, 
     adj = 0.5, font = 2))

 with(USArrests, scatter2D(x = Murder, y = Assault, colvar = Rape, 
     pch = 16, add = TRUE, colkey = FALSE))

# reset plotting parameters
 par(mfrow = pm)



