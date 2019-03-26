library(deSolve)


### Name: lsode
### Title: Solver for Ordinary Differential Equations (ODE)
### Aliases: lsode
### Keywords: math

### ** Examples

## =======================================================================
## Example 1:
##   Various ways to solve the same model.
## =======================================================================

## the model, 5 state variables
f1 <- function  (t, y, parms) {
  ydot <- vector(len = 5)

  ydot[1] <-  0.1*y[1] -0.2*y[2]
  ydot[2] <- -0.3*y[1] +0.1*y[2] -0.2*y[3]
  ydot[3] <-           -0.3*y[2] +0.1*y[3] -0.2*y[4]
  ydot[4] <-                     -0.3*y[3] +0.1*y[4] -0.2*y[5]
  ydot[5] <-                               -0.3*y[4] +0.1*y[5]

  return(list(ydot))
}

## the Jacobian, written as a full matrix
fulljac <- function  (t, y, parms) {
  jac <- matrix(nrow = 5, ncol = 5, byrow = TRUE,
                data = c(0.1, -0.2,  0  ,  0  ,  0  ,
                        -0.3,  0.1, -0.2,  0  ,  0  ,
                         0  , -0.3,  0.1, -0.2,  0  ,
                         0  ,  0  , -0.3,  0.1, -0.2,
                         0  ,  0  ,  0  , -0.3,  0.1))
  return(jac)
}

## the Jacobian, written in banded form
bandjac <- function  (t, y, parms) {
  jac <- matrix(nrow = 3, ncol = 5, byrow = TRUE,
                data = c( 0  , -0.2, -0.2, -0.2, -0.2,
                          0.1,  0.1,  0.1,  0.1,  0.1,
                         -0.3, -0.3, -0.3, -0.3,    0))
  return(jac)
}

## initial conditions and output times
yini  <- 1:5
times <- 1:20

## default: stiff method, internally generated, full Jacobian
out   <- lsode(yini, times, f1, parms = 0, jactype = "fullint")

## stiff method, user-generated full Jacobian
out2  <- lsode(yini, times, f1, parms = 0, jactype = "fullusr",
              jacfunc = fulljac)

## stiff method, internally-generated banded Jacobian
## one nonzero band above (up) and below(down) the diagonal
out3  <- lsode(yini, times, f1, parms = 0, jactype = "bandint",
                              bandup = 1, banddown = 1)

## stiff method, user-generated banded Jacobian
out4  <- lsode(yini, times, f1, parms = 0, jactype = "bandusr",
              jacfunc = bandjac, bandup = 1, banddown = 1)

## non-stiff method
out5  <- lsode(yini, times, f1, parms = 0, mf = 10)

## =======================================================================
## Example 2:
##   diffusion on a 2-D grid
##   partially specified Jacobian
## =======================================================================

diffusion2D <- function(t, Y, par) {
   y <- matrix(nrow = n, ncol = n, data = Y)
   dY   <- r*y     # production

   ## diffusion in X-direction; boundaries = 0-concentration
   Flux <- -Dx * rbind(y[1,],(y[2:n,]-y[1:(n-1),]),-y[n,])/dx
   dY   <- dY - (Flux[2:(n+1),]-Flux[1:n,])/dx

   ## diffusion in Y-direction
   Flux <- -Dy * cbind(y[,1],(y[,2:n]-y[,1:(n-1)]),-y[,n])/dy
   dY    <- dY - (Flux[,2:(n+1)]-Flux[,1:n])/dy

   return(list(as.vector(dY)))
}

## parameters
dy    <- dx <- 1   # grid size
Dy    <- Dx <- 1   # diffusion coeff, X- and Y-direction
r     <- 0.025     # production rate
times <- c(0, 1)

n  <- 50
y  <- matrix(nrow = n, ncol = n, 0)

pa <- par(ask = FALSE)

## initial condition
for (i in 1:n) {
  for (j in 1:n) {
    dst <- (i - n/2)^2 + (j - n/2)^2
    y[i, j] <- max(0, 1 - 1/(n*n) * (dst - n)^2)
  }
}
filled.contour(y, color.palette = terrain.colors)

## =======================================================================
##   jacfunc need not be estimated exactly
##   a crude approximation, with a smaller bandwidth will do.
##   Here the half-bandwidth 1 is used, whereas the true
##   half-bandwidths are equal to n.
##   This corresponds to ignoring the y-direction coupling in the ODEs.
## =======================================================================

print(system.time(
  for (i in 1:20) {
    out  <-  lsode(func = diffusion2D, y = as.vector(y), times = times,
              parms = NULL, jactype = "bandint", bandup = 1, banddown = 1)

    filled.contour(matrix(nrow = n, ncol = n, out[2,-1]), zlim = c(0,1),
                  color.palette = terrain.colors, main = i)

    y <- out[2, -1]
  }
))
par(ask = pa)



