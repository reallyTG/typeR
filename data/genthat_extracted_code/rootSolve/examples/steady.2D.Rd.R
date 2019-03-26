library(rootSolve)


### Name: steady.2D
### Title: Steady-state solver for 2-Dimensional ordinary differential
###   equations
### Aliases: steady.2D
### Keywords: math

### ** Examples

## =======================================================================
## Diffusion in 2-D; imposed boundary conditions
## =======================================================================
diffusion2D <- function(t, Y, par)   {

   y    <- matrix(nr=n,nc=n,data=Y)  # vector to 2-D matrix
   dY   <- -r*y        # consumption
   BND   <- rep(1,n)   # boundary concentration 

   #diffusion in X-direction; boundaries=imposed concentration
   Flux <- -Dx * rbind(y[1,]-BND,(y[2:n,]-y[1:(n-1),]),BND-y[n,])/dx
   dY   <- dY - (Flux[2:(n+1),]-Flux[1:n,])/dx

   #diffusion in Y-direction
   Flux <- -Dy * cbind(y[,1]-BND,(y[,2:n]-y[,1:(n-1)]),BND-y[,n])/dy
   dY    <- dY - (Flux[,2:(n+1)]-Flux[,1:n])/dy

   return(list(as.vector(dY)))
}

# parameters
dy    <- dx <- 1   # grid size
Dy    <- Dx <- 1   # diffusion coeff, X- and Y-direction
r     <- 0.025     # consumption rate

n  <- 100
y  <- matrix(nrow = n, ncol = n, 10.)

# stodes is used, so we should specify the size of the work array (lrw)
# We take a rather large value

system.time(
ST2 <- steady.2D(y, func = diffusion2D, parms = NULL, pos = TRUE,
                 dimens = c(n, n), lrw = 1000000, 
                 atol = 1e-10, rtol = 1e-10, ctol = 1e-10)
)

## Not run: 
##D   # this takes a long time...
##D system.time(
##D ST3 <- steady.2D(y, func = diffusion2D, parms = NULL, 
##D                  dimens = c(n, n), lrw = 1000000, method = "runsteady", 
##D                  time = c(0, 1e6), atol = 1e-10, rtol = 1e-10)
##D )
## End(Not run)

# the actual size of lrw is in the attributes()$dims vector.     
# it is best to set lrw as small as possible 
attributes(ST2)     

image(ST2, legend = TRUE)

# The hard way of plotting:    
#y <- matrix(nr = n, nc = n, data = ST2$y)
#     filled.contour(y, color.palette = terrain.colors)

## =======================================================================
## Diffusion in 2-D; extra flux on 2 boundaries, cyclic in y
## =======================================================================

diffusion2Db <- function(t, Y, par)  {

   y    <- matrix(nr=nx,nc=ny,data=Y)  # vector to 2-D matrix
   dY   <- -r*y        # consumption

   BNDx   <- rep(1,nx)   # boundary concentration
   BNDy   <- rep(1,ny)   # boundary concentration

   #diffusion in X-direction; boundaries=imposed concentration
   Flux <- -Dx * rbind(y[1,]-BNDy,(y[2:nx,]-y[1:(nx-1),]),BNDy-y[nx,])/dx
   dY   <- dY - (Flux[2:(nx+1),]-Flux[1:nx,])/dx

   #diffusion in Y-direction
   Flux <- -Dy * cbind(y[,1]-BNDx,(y[,2:ny]-y[,1:(ny-1)]),BNDx-y[,ny])/dy
   dY    <- dY - (Flux[,2:(ny+1)]-Flux[,1:ny])/dy

   # extra flux on two sides
   dY[,1] <- dY[,1]+  10
   dY[1,] <- dY[1,]+  10

   # and exchange between sides on y-direction
   dY[,ny] <- dY[,ny]+ (y[,1]-y[,ny])*10

   return(list(as.vector(dY)))
}

# parameters
dy    <- dx <- 1   # grid size
Dy    <- Dx <- 1   # diffusion coeff, X- and Y-direction
r     <- 0.025     # consumption rate

nx  <- 50
ny  <- 100
y  <- matrix(nrow = nx, ncol = ny, 10.)

print(system.time(
  ST2 <- steady.2D(y, func = diffusion2Db, parms = NULL, pos = TRUE,
          dimens = c(nx, ny), verbose = TRUE, lrw = 283800, 
          atol = 1e-10, rtol = 1e-10, ctol = 1e-10, 
          cyclicBnd = 2)       # y-direction: cyclic boundary
))

image(ST2)
#y <- matrix(nrow = nx, ncol = ny, data = ST2$y)
#    filled.contour(y,color.palette=terrain.colors)





