library(OceanView)


### Name: Tracers in 2D
### Title: Plots tracer distributions in 2-D.
### Aliases: tracers2D tracers2Drgl
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
 xi <- c(0.125 * rnorm(100) - pi/2, 0.125 * rnorm(100) - pi/4)
 yi <- 0.25 * rnorm(200) + pi/2

# the species
 species <- c(rep(1, 100), rep(2, 100))   

# set initial conditions 
 xp <- xi; yp <- yi

## =======================================================================
## using a mask and contour
## =======================================================================

 Z <- z; Z[abs(Z) < 0.1] <- NA
 par(mfrow = c(2, 2))

 for (i in 1:4) {
  # update tracer distribution
   xp <- xp + 0.25 * rnorm(200)
   yp <- yp + 0.025 * rnorm(200) 
  
  # plot new tracer distribution
   tracers2D(xp, yp, colvar = species, pch = ".", cex = 5, 
     main = paste("timestep ", i), col = c("orange", "blue"), 
     colkey = list(side = 1, length = 0.5, labels = c("sp1","sp2"),
     at = c(1.25, 1.75), dist = 0.075), NAcol = "black", 
     mask = list(x = x, y = y, z = Z), 
     contour = list(x = x, y = y, z = Z) )
 }

## =======================================================================
## using image and contour
## =======================================================================

 for (i in 1:4) {
  # update tracer distribution
   xp <- xp + 0.25 * rnorm(200)
   yp <- yp + 0.025 * rnorm(200) 
  
  # plot new tracer distribution
   tracers2D(xp, yp, colvar = species, pch = ".", cex = 5, 
     main = paste("timestep ", i), col = c("orange", "blue"), 
     colkey = list(side = 1, length = 0.5, labels = c("sp1","sp2"),
     at = c(1.25, 1.75), dist = 0.075), NAcol = "black", 
     contour = list(x = x, y = y, z = z),
     image = list(x = x, y = y, z = z, colkey = TRUE))
 }

## =======================================================================
## rgl tracer plot
## =======================================================================

# here the image has to be drawn first
 image2Drgl(x = x, y = y, z = z)

# set initial conditions 
 xp <- xi; yp <- yi
 nstep <- 40
 for (i in 1:nstep) {
  # update tracer distribution
   xp <- xp + 0.25 * rnorm(200)
   yp <- yp + 0.025 * rnorm(200) 
  
  # plot new tracer distribution                                                              n
   tracers2Drgl(xp, yp, colvar = species,  cex = 1,
     main = paste("timestep ", i), col = c("orange", "blue"))

 }

# reset plotting parameters
 par(mfrow = pm)



