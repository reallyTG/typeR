library(rootSolve)


### Name: steady.3D
### Title: Steady-state solver for 3-Dimensional ordinary differential
###   equations
### Aliases: steady.3D
### Keywords: math

### ** Examples

## =======================================================================
## Diffusion in 3-D; imposed boundary conditions
## =======================================================================
diffusion3D <- function(t, Y, par)   {
   yy    <- array(dim=c(n,n,n),data=Y)  # vector to 3-D array
   dY   <- -r*yy        # consumption
   BND   <- rep(1,n)   # boundary concentration
   for (i in 1:n) {
     y <- yy[i,,]
     #diffusion in X-direction; boundaries=imposed concentration
     Flux <- -Dy * rbind(y[1,]-BND,(y[2:n,]-y[1:(n-1),]),BND-y[n,])/dy
     dY[i,,]   <- dY[i,,] - (Flux[2:(n+1),]-Flux[1:n,])/dy

     #diffusion in Y-direction
     Flux <- -Dz * cbind(y[,1]-BND,(y[,2:n]-y[,1:(n-1)]),BND-y[,n])/dz
     dY[i,,]    <- dY[i,,] - (Flux[,2:(n+1)]-Flux[,1:n])/dz
   }
   for (j in 1:n) {
     y <- yy[,j,]
     #diffusion in X-direction; boundaries=imposed concentration
     Flux <- -Dx * rbind(y[1,]-BND,(y[2:n,]-y[1:(n-1),]),BND-y[n,])/dx
     dY[,j,]   <- dY[,j,] - (Flux[2:(n+1),]-Flux[1:n,])/dx

     #diffusion in Y-direction
     Flux <- -Dz * cbind(y[,1]-BND,(y[,2:n]-y[,1:(n-1)]),BND-y[,n])/dz
     dY[,j,]    <- dY[,j,] - (Flux[,2:(n+1)]-Flux[,1:n])/dz
   }
   for (k in 1:n) {
     y <- yy[,,k]
     #diffusion in X-direction; boundaries=imposed concentration
     Flux <- -Dx * rbind(y[1,]-BND,(y[2:n,]-y[1:(n-1),]),BND-y[n,])/dx
     dY[,,k]   <- dY[,,k] - (Flux[2:(n+1),]-Flux[1:n,])/dx

     #diffusion in Y-direction
     Flux <- -Dy * cbind(y[,1]-BND,(y[,2:n]-y[,1:(n-1)]),BND-y[,n])/dy
     dY[,,k]    <- dY[,,k] - (Flux[,2:(n+1)]-Flux[,1:n])/dy
   }
   return(list(as.vector(dY)))
}

  # parameters
  dy    <- dx <- dz <-1   # grid size
  Dy    <- Dx <- Dz <-1   # diffusion coeff, X- and Y-direction
  r     <- 0.025     # consumption rate

  n  <- 10
  y  <- array(dim=c(n, n, n), data = 10.)

  # stodes is used, so we should specify the size of the work array (lrw)
  # We take a rather large value initially

  print(system.time(
  ST3 <- steady.3D(y, func =diffusion3D, parms = NULL, pos = TRUE,
                   dimens = c(n, n, n), lrw = 100000,
                   atol = 1e-10, rtol = 1e-10, ctol = 1e-10, 
                   verbose = TRUE)
  ))

  # the actual size of lrw is in the attributes()$dims vector.     
  # it is best to set lrw as small as possible 
  attributes(ST3)     

  # image plot
  y <- array(dim=c(n, n, n), data = ST3$y)
  filled.contour(y[ , ,n/2], color.palette = terrain.colors)
    
  # rootSolve's image plot, looping over 3rd dimension
  image(ST3, mfrow = c(4,3))

  # loop over 1st dimension, contours, legends added
  image(ST3, mfrow = c(2, 2), add.contour = TRUE, legend = TRUE,
        dimselect = list(x = c(1, 4, 8, 10)))




