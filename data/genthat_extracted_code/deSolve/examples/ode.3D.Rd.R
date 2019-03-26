library(deSolve)


### Name: ode.3D
### Title: Solver for 3-Dimensional Ordinary Differential Equations
### Aliases: ode.3D
### Keywords: math

### ** Examples

## =======================================================================
## Diffusion in 3-D; imposed boundary conditions
## =======================================================================
diffusion3D <- function(t, Y, par) {

  ## function to bind two matrices to an array
  mbind <- function (Mat1, Array, Mat2, along = 1) {
    dimens <- dim(Array) + c(0, 0, 2)
    if (along == 3)
      array(dim = dimens, data = c(Mat1, Array, Mat2))
    else if (along == 1)
      aperm(array(dim = dimens,
        data=c(Mat1, aperm(Array, c(3, 2, 1)), Mat2)), c(3, 2, 1))
    else if (along == 2)
      aperm(array(dim = dimens,
        data = c(Mat1, aperm(Array, c(1, 3, 2)), Mat2)), c(1, 3, 2))
  }

  yy  <- array(dim=c(n, n, n), data = Y)      # vector to 3-D array
  dY  <- -r*yy                                # consumption
  BND <- matrix(nrow = n, ncol = n, data = 1) # boundary concentration

  ## diffusion in x-direction
  ## new array including boundary concentrations in X-direction
  BNDx <- mbind(BND, yy, BND, along = 1)
  ## diffusive Flux
  Flux <- -Dx * (BNDx[2:(n+2),,] - BNDx[1:(n+1),,])/dx
  ## rate of change = - flux gradient
  dY[] <- dY[] - (Flux[2:(n+1),,] - Flux[1:n,,])/dx

  ## diffusion in y-direction
  BNDy <- mbind(BND, yy, BND, along = 2)
  Flux <- -Dy * (BNDy[,2:(n+2),] - BNDy[,1:(n+1),])/dy
  dY[] <- dY[] - (Flux[,2:(n+1),] - Flux[,1:n,])/dy

  ## diffusion in z-direction
  BNDz <- mbind(BND, yy, BND, along = 3)
  Flux <- -Dz * (BNDz[,,2:(n+2)] - BNDz[,,1:(n+1)])/dz
  dY[] <- dY[] - (Flux[,,2:(n+1)] - Flux[,,1:n])/dz

  return(list(as.vector(dY)))
}

## parameters
dy <- dx <- dz <-1   # grid size
Dy <- Dx <- Dz <-1   # diffusion coeff, X- and Y-direction
r  <- 0.025          # consumption rate

n  <- 10
y  <- array(dim=c(n,n,n),data=10.)

## use lsodes, the default (for n>20, Runge-Kutta more efficient)
print(system.time(
  RES <- ode.3D(y, func = diffusion3D, parms = NULL, dimens = c(n, n, n),
                times = 1:20, lrw = 120000, atol = 1e-10,
                rtol = 1e-10, verbose = TRUE)
))

y <- array(dim = c(n, n, n), data = RES[nrow(RES), -1])
filled.contour(y[, , n/2], color.palette = terrain.colors)

summary(RES)

## Not run: 
##D for (i in 2:nrow(RES)) {
##D   y <- array(dim=c(n,n,n),data=RES[i,-1])
##D   filled.contour(y[,,n/2],main=i,color.palette=terrain.colors)
##D }
## End(Not run)



