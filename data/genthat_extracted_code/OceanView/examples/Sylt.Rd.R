library(OceanView)


### Name: Sylt data set
### Title: Hydrodynamic model output (getm) of Sylt-Romo Bight
### Aliases: Syltsurf Sylttran Sylt3D
### Keywords: datasets

### ** Examples

# save plotting parameters
 pm <- par("mfrow")
 mar <- par("mar")
   
## =============================================================================
## Show position of transect and 3D box in bathymetry
## =============================================================================  

 par(mfrow = c(2, 2))
 par(mar = c(4, 4, 4, 4))

 x <- Syltsurf$x ; y <- Syltsurf$y ; depth <- Syltsurf$depth
 image2D(z = depth, x = x, y = y, clab = c("depth", "m"))

# position of transect 
 with (Sylttran, points (x, rep(y, length(x)), 
         pch = 16, col = "grey"))
# position of 3-D area
 with (Sylt3D, rect(x[1], y[1], x[length(x)], y[length(y)], lwd = 3))
         
 image2D(z = depth, x = x, y = y, clab = c("depth", "m"), log = "z")

# sigma coordinates of the transect (at time = 10)
 matplot(Sylttran$x, Sylttran$sigma[,,10], type = "l", 
         main = "sigma", ylim = c(25, -2), col = "black", lty = 1)

# perspective view - reduce resolution for speed
 ix <- seq(1, length(x), by = 3)
 iy <- seq(1, length(y), by = 3)
 
 par(mar = c(1, 1, 1, 2))
 persp3D(z = -depth[ix, iy], x = x[ix], y = y[iy], 
   scale = FALSE, expand = 0.2, ticktype = "detailed", 
   col = "grey", shade = 0.6, bty = "f",
   plot = FALSE)

# add 3-D region; small amount added to z so that it is visible in rgl   
 persp3D(z = -Sylt3D$depth + 1e-3, x = Sylt3D$x, y = Sylt3D$y, 
   col = alpha.col("red", alpha = 0.4), add = TRUE,
   plot = FALSE)

# transect
 with (Sylttran, points3D(x = x, y = rep(y, length(x)), 
   z = rep(0, length(x)), pch = 16, add = TRUE, colkey = FALSE))

## Not run: 
##D  plotrgl()
##D  plotrgl(lighting = TRUE, new = FALSE, smooth = TRUE)
## End(Not run)

## =============================================================================
## Data Syltsurf: Surface elevation
## =============================================================================  

 par(mfrow = c(2, 2), mar = c(0, 0, 1, 0))
# reduce resolution for speed
 ix <- seq(1, length(x), by = 3)
 iy <- seq(1, length(y), by = 3)

 clim <- range(Syltsurf$elev, na.rm = TRUE)
 for (i in 1:3) 
   persp3D(z = -depth[ix, iy], colvar = Syltsurf$elev[ix,iy,i], 
     x = x[ix], y = y[iy], clim = clim, inttype = 2,  d = 2, 
     scale = FALSE, expand = 0.1, colkey = FALSE, shade = 0.5, 
       main = paste(format(Syltsurf$time[i], digits = 3), " hr"))
 par(mar = c(3, 3, 3, 3))
 colkey(clim = clim, clab = c("elevation", "m")) 
  
# can also be done using shaded image2D plots, faster
 par(mfrow = c(2, 2), mar = c(3, 3, 3, 3))
 clim <- range(Syltsurf$elev, na.rm = TRUE)
 for (i in 1:3) 
   image2D(z = -depth[ix, iy], colvar = Syltsurf$elev[ix,iy,i], 
     x = x[ix], y = y[iy], clim = clim, 
     colkey = FALSE, shade = 0.3, resfac = 2,
       main = paste(format(Syltsurf$time[i], digits = 3), " hr"))
 colkey(clim = clim, clab = c("elevation", "m")) 

## =============================================================================
## Data Syltsurf: Surface currents
## =============================================================================  
 
 par(mfrow = c(1, 1))
 Speed <- sqrt(Syltsurf$u[,,2]^2 + Syltsurf$v[,,2]^2)

 with (Syltsurf,
   quiver2D(x = x, y = y, u = u[,,2], v = v[,,2], col = gg.col(100),
     xlim = c(5, 20), ylim = c(10, 25), by = 3, 
     colvar = Speed, clab = c("speed", "m/s"), 
     main = paste(formatC(time[1]), " hr"), scale = 1.5, 
     image = list(z = depth, x = x, y = y, col = "white",  #background
       NAcol = "darkblue"),
     contour = list(z = depth, x = x, y = y, col = "black",#depth 
       lwd = 2)
     )
  )

## =============================================================================
## Data Sylttran: plot a transect
## =============================================================================

 par(mfrow = c(1, 1), mar = c(4, 4, 4, 2))
 D   <- seq(-1, 20, by = 0.02)

 visc <- mapsigma (Sylttran$visc [ , ,1], x = Sylttran$x, 
     sigma = Sylttran$sigma[ , ,1], depth = D, resfac = 2)

 image2D(visc$var, x = visc$x, y = -visc$depth, ylim = c(-20, 1),
     main = "eddy viscosity", ylab = "m", xlab = "hour", 
     clab = "m2/s")
     
# show position of timeseries in next example
 abline(v = visc$x[45])  

## =============================================================================
## Data Sylttran: plot a time-series
## =============================================================================

 par(mfrow = c(1, 1), mar = c(5, 4, 4, 3))
 ix <- 45 

 visct <-  Sylttran$visc  [ix, ,]
 sig   <-  Sylttran$sigma [ix, ,]  

# sigma coordinates are first dimension (signr)
 visc <- mapsigma(visct, sigma = sig, signr = 1, 
   x = Sylttran$time, numdepth = 100, resfac = 3)
 D    <- -visc$depth

 image2D(t(visc$var), x = visc$x, y = D, NAcol = "black", 
   ylim = range(D), main = "eddy viscosity", 
   ylab = "m", xlab = "hour", clab = "m2/s")

## =============================================================================
## Data Sylt3D: increase resolution and map from sigma to depth
## =============================================================================

# select a time series point
 it <- 1
 par(mfrow = c(1, 1))
 sigma  <- Sylt3D$sigma[,,,it]
 visc   <- Sylt3D$visc [,,,it]  
 (D <- dim(sigma))     # x, y, z
 
# remap the data from sigma coordinates to depth coordinates
# depth from max in first box to max in last box
 depth <- seq(max(sigma[,,D[3]], na.rm = TRUE), 
              max(sigma[,,1   ], na.rm = TRUE), length.out = 20)

# Step-bystep mapping, increasing the resolution
 z    <- 1:21
 x    <- Sylt3D$x
 y    <- Sylt3D$y

 xto <- seq(min(x), max(x), length.out = 30)
 yto <- seq(min(y), max(y), length.out = 30)

# higher resolution 
 Sigma <- remap(sigma, x, y, z, xto, yto, zto = z)$var
 Visc  <- remap(visc, x, y, z, xto, yto, zto = z)$var

# viscosity in sigma coordinates
 visc_sig <- mapsigma(Visc, sigma = Sigma, depth = depth)

## =============================================================================
## The 3-D data set - plotted as slices
## =============================================================================

 slice3D(xto, yto, -visc_sig$depth, colvar = visc_sig$var, 
   scale = FALSE, expand = 0.1, NAcol = "transparent", 
   ys = yto[seq(1, length(yto), length.out = 10)], plot = FALSE, 
   colkey = list(side = 1))
 persp3D(x = x, y = y, z = -Sylt3D$depth, add = TRUE, 
   border = "black", facets = NA, colkey = FALSE)

# visualise it in rgl window
 plotrgl()

## the same, as a movie

 persp3Drgl(x = x, y = y, z = -Sylt3D$depth, smooth = TRUE, 
   col = "grey", lighting = TRUE)

 movieslice3D(xto, yto, -visc_sig$depth, colvar = visc_sig$var, 
   add = TRUE, ys = yto)

# in order to wait inbetween slice drawings until a key is hit:
## Not run: 
##D  persp3Drgl(x = x, y = y, z = -Sylt3D$depth, smooth = TRUE, 
##D    col = "grey", lighting = TRUE)
##D  movieslice3D(xto, yto, -visc_sig$depth, colvar = visc_sig$var, add = TRUE, 
##D    ask = TRUE, ys = yto)
## End(Not run)

## =============================================================================
## The 3-D data set - plotted as isosurfaces
## =============================================================================

 isosurf3D(xto, yto, -visc_sig$depth, colvar = visc_sig$var, 
   level = c(0.005, 0.01, 0.015), col = c("red", "blue", "green"), 
   scale = FALSE, expand = 0.1, ticktype = "detailed", 
   main = "viscosity", clab = "m2/s", 
   plot = FALSE, colkey = list(side = 1))
 persp3D(x = x, y = y, z = -Sylt3D$depth, border = "black", 
   col = "white", add = TRUE, plot = FALSE)


## Not run: 
##D  plotdev(alpha = 0.3, phi = 30)         # this is slow
## End(Not run)
 plotrgl(alpha = 0.3)

# reset plotting parameters
 par(mar = mar)
 par(mfrow = pm)



