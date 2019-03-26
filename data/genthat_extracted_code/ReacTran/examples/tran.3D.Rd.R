library(ReacTran)


### Name: tran.3D
### Title: General Three-Dimensional Advective-Diffusive Transport
### Aliases: tran.3D
### Keywords: utilities

### ** Examples

## =============================================================================
## Diffusion in 3-D; imposed boundary conditions
## =============================================================================
diffusion3D <- function(t, Y, par) {

  yy    <- array(dim = c(n, n, n), data = Y)  # vector to 3-D array
  dY    <- -r * yy                            # consumption
  BND   <- matrix(nrow = n, ncol = n, 1)      # boundary concentration

  dY <- dY + tran.3D(C = yy,
      C.x.up = BND, C.y.up = BND, C.z.up = BND,
      C.x.down = BND, C.y.down = BND, C.z.down = BND,
      D.x = Dx, D.y = Dy, D.z = Dz,
      dx = dx, dy = dy, dz = dz, full.check = TRUE)$dC
  return(list(dY))
}

# parameters
dy   <- dx <- dz <- 1   # grid size
Dy   <- Dx <- Dz <- 1   # diffusion coeff, X- and Y-direction
r    <- 0.025     # consumption rate

n  <- 10
y  <- array(dim = c(n, n, n), data = 10.)

print(system.time(
  ST3 <- steady.3D(y, func = diffusion3D, parms = NULL, 
                 pos = TRUE, dimens = c(n, n, n),
                 lrw = 2000000, verbose = TRUE)
))

pm <- par(mfrow = c(1,1))
y <- array(dim = c(n, n, n), data = ST3$y)
filled.contour(y[ , ,n/2], color.palette = terrain.colors)

# a selection in the x-direction
image(ST3, mfrow = c(2, 2), add.contour = TRUE, legend = TRUE,
      dimselect = list(x = c(1, 4, 8, 10)))

par(mfrow = pm)



