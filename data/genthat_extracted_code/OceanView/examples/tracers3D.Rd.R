library(OceanView)


### Name: Tracers in 3D
### Title: Plotting tracer distributions in 3D
### Aliases: tracers3D tracers3Drgl moviepoints3D
### Keywords: hplot

### ** Examples

# save plotting parameters
 pm <- par("mfrow")

## =======================================================================
## Create topography, data
## =======================================================================

# The topographic surface
 x <-  seq(-pi, pi, by = 0.2)
 y <-  seq(0, pi, by = 0.1)
 M <- mesh(x, y)
 z <- with(M, sin(x)*sin(y))

# Initial condition
 xi <- c(0.25 * rnorm(100) - pi/2, 0.25 * rnorm(100) - pi/4)
 yi <- 0.25 * rnorm(200) + pi/2
 zi <- 0.005*rnorm(200) + 0.5

# the species
 species <- c(rep(1, 100), rep(2, 100))   

# set initial conditions 
 xp <- xi; yp <- yi; zp <- zi

## =======================================================================
## Traditional graphics
## =======================================================================

 par(mfrow = c(2, 2))

# Topography is defined by argument surf
 for (i in 1:4) {
  # update tracer distribution
   xp <- xp + 0.25 * rnorm(200)
   yp <- yp + 0.025 * rnorm(200) 
   zp <- zp + 0.25 *rnorm(200)
  
  # plot new tracer distribution
   tracers3D(xp, yp, zp, colvar = species, pch = ".", cex = 5, 
     main = paste("timestep ", i), col = c("orange", "blue"), 
     surf = list(x, y, z = z, theta = 0, facets = FALSE),
     colkey = list(side = 1, length = 0.5, labels = c("sp1","sp2"),
                   at = c(1.25, 1.75), dist = 0.075))
 }

# same, but creating topography first
## Not run: 
##D # create the topography on which to add points 
##D  persp3D(x, y, z = z, theta = 0, facets = FALSE, plot = FALSE)
##D 
##D  for (i in 1:4) {
##D   # update tracer distribution
##D    xp <- xp + 0.25 * rnorm(200)
##D    yp <- yp + 0.025 * rnorm(200) 
##D    zp <- zp + 0.25 *rnorm(200)
##D   
##D   # plot new tracer distribution
##D    tracers3D(xp, yp, zp, colvar = species, pch = ".", cex = 5, 
##D      main = paste("timestep ", i), col = c("orange", "blue"), 
##D      colkey = list(side = 1, length = 0.5, labels = c("sp1","sp2"),
##D                     at = c(1.25, 1.75), dist = 0.075))
##D  }
## End(Not run)

## =======================================================================
## rgl graphics
## =======================================================================

# pause <- 0.05
# create a suitable topography
 persp3D(x, y, z = z, theta = 0, facets = NA, plot = FALSE)

 plotrgl( )
 xp <- xi; yp <- yi; zp <- zi
 
 nstep <- 10
 for (i in 1:nstep) {
   xp <- xp + 0.05 * rnorm(200) + 0.05
   yp <- yp + 0.0025 * (rnorm(200) + 0.0025)
   zp <- zp + 0.05 *rnorm(200)

#   tracers3Drgl(xp, yp, zp, col = c(rep("orange", 100), rep("blue", 100)),
#     main = paste("timestep ", i))
# or:
   tracers3Drgl(xp, yp, zp, colvar = species, col = c("orange", "blue"),
     main = paste("timestep ", i))
#   Sys.sleep(pause)
# or:  readline("hit enter for next")
 }

# using function moviepoints3D

## Not run: 
##D # first create the data in matrices
##D  xp <- matrix(nrow = 200, ncol = nstep, data = xi) 
##D  yp <- matrix(nrow = 200, ncol = nstep,  data = yi) 
##D  zp <- matrix(nrow = 200, ncol = nstep, data = zi)
##D  tp <- matrix(nrow = 200, ncol = nstep, data = 0)
##D  cv <- matrix(nrow = 200, ncol = nstep, data = species)
##D  nstep <- 10
##D  for (i in 2:nstep) {
##D    xp[,i] <- xp[,i-1] + 0.05 * rnorm(200) + 0.05
##D    yp[,i] <- yp[,i-1] + 0.0025 * (rnorm(200) + 0.0025)
##D    zp[,i] <- zp[,i-1] + 0.05 *rnorm(200)
##D    tp[,i] <- i
##D  }
##D # create the topography
##D  persp3Drgl(x, y, z = z, theta = 0, lighting = TRUE, smooth = TRUE)
##D 
##D # add moviepoints:
##D   moviepoints3D (xp, yp, zp, colvar = cv, t = tp, 
##D     wait = 0.05, cex = 10, col = c("red", "orange")) 
##D  
## End(Not run)

# reset plotting parameters
 par(mfrow = pm)



