library(ReacTran)


### Name: tran.cylindrical
### Title: Diffusive Transport in cylindrical (r, theta, z) and spherical
###   (r, theta, phi) coordinates.
### Aliases: tran.cylindrical tran.spherical
### Keywords: utilities

### ** Examples

## =============================================================================
## Testing the functions
## =============================================================================
# Grid definition
r.N     <- 4   # number of cells in r-direction
theta.N <- 6   # number of cells in theta-direction
z.N     <- 3   # number of cells in z-direction

D       <- 100 # diffusion coefficient
 
r      <- seq(0,   8, len = r.N+1)       # cell size r-direction [cm]
theta  <- seq(0,2*pi, len = theta.N+1)   # theta-direction - theta: from 0, 2pi
phi    <- seq(0,2*pi, len = z.N+1)       # phi-direction (0,2pi)
z      <- seq(0,5, len = z.N+1)          # cell size z-direction [cm]
 
# Intial conditions 
C <- array(dim = c(r.N, theta.N, z.N), data = 0)

# Concentration boundary conditions
tran.cylindrical (C = C, D.r = D, D.theta = D, 
  C.r.up = 1, C.r.down = 1,
  C.theta.up = 1, C.theta.down = 1, 
  C.z.up = 1, C.z.down = 1,
  r = r, theta = theta, z = z )

tran.spherical (C = C, D.r = D, D.theta = D, 
  C.r.up = 1, C.r.down = 1, C.theta.up = 1, C.theta.down = 1, 
  C.phi.up = 1, C.phi.down = 1,
  r = r, theta = theta, phi = phi)

# Flux boundary conditions
tran.cylindrical(C = C, D.r = D, r = r, theta = theta, z = z,
  flux.r.up = 10, flux.r.down = 10,
  flux.theta.up = 10, flux.theta.down = 10,
  flux.z.up = 10, flux.z.down = 10)

tran.spherical(C = C, D.r = D, r = r, theta = theta, phi = phi,
  flux.r.up = 10, flux.r.down = 10,
  flux.theta.up = 10, flux.theta.down = 10,
  flux.phi.up = 10, flux.phi.down = 10)

# cyclic boundary conditions
tran.cylindrical(C = C, D.r = D, r = r, theta = theta, z = z,
  cyclicBnd = 1:3)
tran.spherical(C = C, D.r = D, r = r, theta = theta, phi = phi,
  cyclicBnd = 1:3)

# zero-gradient boundary conditions
tran.cylindrical(C = C, D.r = D, r = r, theta = theta, z = z)
tran.spherical(C = C, D.r = D, r = r, theta = theta, phi = phi)

## =============================================================================
## A model with diffusion and first-order consumption
## =============================================================================

N     <- 10          # number of grid cells
rr    <- 0.005       # consumption rate
D     <- 400

r       <- seq (2, 4, len = N+1)
theta   <- seq (0, 2*pi, len = N+1)
z       <- seq (0, 3, len = N+1)
phi     <- seq (0, 2*pi, len = N+1)

# The model equations
Diffcylin <- function (t, y, parms)  {
  CONC  <- array(dim = c(N, N, N), data = y)
  tran  <- tran.cylindrical(CONC, 
        D.r = D, D.theta = D, D.z = D,
        r = r, theta = theta, z = z,
        C.r.up = 0,  C.r.down = 1,
        cyclicBnd = 2)
  dCONC <- tran$dC  - rr * CONC
  return (list(dCONC))
}

Diffspher <- function (t, y, parms)  {
  CONC  <- array(dim = c(N, N, N), data = y)
  tran  <- tran.spherical (CONC, 
        D.r = D, D.theta = D, D.phi = D,
        r = r, theta = theta, phi = phi,
        C.r.up = 0,  C.r.down = 1,
        cyclicBnd = 2:3)
  dCONC <- tran$dC  - rr * CONC
  return (list(dCONC))
}

# initial condition: 0 everywhere, except in central point
y   <- array(dim = c(N, N, N), data = 0)
N2  <- ceiling(N/2)

y[N2, N2, N2] <- 100  # initial concentration in the central point...

# solve to steady-state; cyclicBnd = 2, 
outcyl <- steady.3D (y = y, func = Diffcylin, parms = NULL,
                  dim = c(N, N, N), lrw = 1e6, cyclicBnd = 2)

STDcyl <- array(dim = c(N, N, N), data = outcyl$y)
image(STDcyl[,,1])

# For spherical coordinates, cyclic Bnd = 2, 3
outspher <- steady.3D (y = y, func = Diffspher, parms = NULL, pos=TRUE,
                  dim = c(N, N, N), lrw = 1e6, cyclicBnd = 2:3)

#STDspher <- array(dim = c(N, N, N), data = outspher$y)
#image(STDspher[,,1])

## Not run: 
##D   image(outspher)
## End(Not run)          



