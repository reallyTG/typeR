library(OceanView)


### Name: Chesapeake data set
### Title: Particle transport in Chesapeake Bay
### Aliases: Chesapeake Ltrans
### Keywords: datasets

### ** Examples

# save plotting parameters
 pm <- par("mfrow")
 mar <- par("mar")
   
## =============================================================================
## Show bathymetry and initial distribution of particles
## =============================================================================  

 par(mfrow = c(1, 1))

 lon <- Chesapeake$lon
 lat <- Chesapeake$lat
 depth <- Chesapeake$depth
 init  <- Chesapeake$init
 
 image2D(z = depth, x = lon, y = lat, clab = c("depth", "m"), 
   xlab = "lon", ylab = "lat")

# position of particles 
 with (init, scatter2D(lon, lat, colvar = source, pch = 16, cex = 0.5, 
   col =  c("green", "orange"), add = TRUE, colkey = FALSE))

 par (mar = c(2, 2, 2, 2))
# same, as persp plot
 persp3D(x = lon, y = lat, z = -depth, scale = FALSE, 
   expand = 0.02, main = "initial particle distribution", 
   plot = FALSE)

 points3D(x = init$lon, y = init$lat, z = -init$depth, 
  colvar = init$source, col = c("green", "orange"), 
  pch = 16, cex = 0.5, 
  add = TRUE, colkey = FALSE, plot = FALSE)

## Not run: 
##D    plotdev(lighting = TRUE, lphi = 45)
## End(Not run) 
 plotrgl(lighting = TRUE, smooth = TRUE)

## =============================================================================
## Tracer output in 3D, traditional device
## =============================================================================  
## Not run: 
##D  par(mfrow = c(2, 1), mar = c(2, 2, 2, 2)) 
##D  for (i in c(50, 100))
##D    tracers3D(Ltrans[, 1, i], Ltrans[, 2, i], Ltrans[, 3, i], 
##D              colvar = Ltrans[ ,4, i], col = c("green", "orange"),
##D              pch = 16, cex = 0.5, 
##D              surf = list(x = lon, y = lat, z = -depth, scale = FALSE, 
##D                expand = 0.02, colkey = FALSE, shade = 0.3, 
##D                colvar = depth), colkey = FALSE,
##D              main = paste("time ", i))
## End(Not run)

## =============================================================================
## Tracer output in 3D, using rgl
## =============================================================================  

 persp3D(x = lon, y = lat, z = -depth, colvar = depth, scale = FALSE, 
   expand = 0.02, main = "particle distribution", plot = FALSE)

 plotrgl(lighting = TRUE, smooth = TRUE) 
 
# you may zoom to the relevant region, or cut a region
# cutrgl()  
 for (i in seq(1, 108, by = 4)) {
   tracers3Drgl(Ltrans[, 1, i], Ltrans[, 2, i], Ltrans[, 3, i], 
             colvar = Ltrans[ ,4, i], col = c("green", "orange"),
             main = paste("time ", i))
# remove # to slow down
#   Sys.sleep(0.1)  
 }  

# using function moviepoints3D
## Not run: 
##D  persp3Drgl(x = lon, y = lat, z = -depth, colvar = depth, scale = FALSE, 
##D    expand = 0.02, main = "particle distribution", 
##D    lighting = TRUE, smooth = TRUE) 
##D 
##D  nt <- dim(Ltrans)[3]  # number of time points
##D  np <- dim(Ltrans)[1]  # number of particles
##D  
##D  times <- rep(1:nt, each = np)
##D  
##D  moviepoints3D(x = Ltrans[, 1, ], y = Ltrans[, 2, ], z = Ltrans[, 3, ], 
##D                t = times, colvar = Ltrans[ ,4, ], col = c("green", "orange"),
##D                cex = 5, ask = TRUE)
##D 
## End(Not run)
## =============================================================================
## Tracer output in 2D, traditional device
## =============================================================================  

 par(mfrow = c(2, 2)) 
 for (i in seq(10, 106, length.out = 4)) 
   tracers2D(Ltrans[, 1, i], Ltrans[, 2, i],  
             colvar = Ltrans[ ,4, i], col = c("green", "orange"),
             pch = 16, cex = 0.5, 
             image = list(x = lon, y = lat, z = depth), colkey = FALSE,
             main = paste("time ", i))

## =============================================================================
## Tracer output in 2D, rgl
## =============================================================================  
 
 image2Drgl (x = lon, y = lat, z = depth)
 for (i in seq(1, 108, by = 3)) {
   tracers2Drgl(Ltrans[, 1, i], Ltrans[, 2, i],  
             colvar = Ltrans[ ,4, i], col = c("green", "orange"))
# remove # to slow down
#   Sys.sleep(0.1)  
 }  

# reset plotting parameters
 par(mar = mar)
 par(mfrow = pm)



