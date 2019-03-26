library(ReacTran)


### Name: tran.polar
### Title: Diffusive Transport in polar (r, theta) coordinates.
### Aliases: tran.polar polar2cart
### Keywords: utilities

### ** Examples

## =============================================================================
## Testing the functions
## =============================================================================
# Parameters
F        <- 100             # input flux [micromol cm-2 yr-1]
D        <- 400             # mixing coefficient [cm2 yr-1]

# Grid definition
r.N   <- 4     # number of cells in r-direction
theta.N <- 6   # number of cells in theta-direction
r.L <- 8       # domain size r-direction [cm]
r      <- seq(0, r.L,len = r.N+1)      # cell size r-direction [cm]
theta  <- seq(0, 2*pi,len = theta.N+1) # theta-direction - theta: from 0, 2pi
 
# Intial conditions 
C <- matrix(nrow = r.N, ncol = theta.N, data = 0)

# Boundary conditions: fixed concentration  
C.r.up       <- rep(1, times = theta.N)
C.r.down     <- rep(0, times = theta.N)
C.theta.up   <- rep(1, times = r.N)
C.theta.down <- rep(0, times = r.N)

# Concentration boundary conditions
tran.polar(C = C, D.r = D, D.theta = D, 
  r = r, theta = theta,
  C.r.up = C.r.up, C.r.down = C.r.down, 
  C.theta.up = C.theta.up, C.theta.down = C.theta.down)

# Flux boundary conditions
flux.r.up <- rep(200, times = theta.N)
flux.r.down <- rep(-200, times = theta.N)
flux.theta.up <- rep(200, times = r.N)
flux.theta.down <- rep(-200, times = r.N)

tran.polar(C = C, D.r = D, r = r, theta = theta,
  flux.r.up = flux.r.up, flux.r.down = flux.r.down,
  flux.theta.up = flux.theta.up, flux.theta.down = flux.theta.down,
  full.output = TRUE)


## =============================================================================
## A model with diffusion and first-order consumption
## =============================================================================
N     <- 50          # number of grid cells
XX    <- 4           # total size
rr    <- 0.005       # consumption rate
ini   <- 1           # initial value at x=0
D     <- 400

r     <- seq (2, 4, len = N+1)
theta   <- seq(0, 2*pi, len = N+1)
theta.m <- 0.5*(theta[-1]+theta[-(N+1)])

# The model equations

Diffpolar <- function (t, y, parms)  {
  CONC  <- matrix(nrow = N, ncol = N, data = y)
  tran  <- tran.polar(CONC, D.r = D, D.theta = D, r = r, theta = theta,
        C.r.up = 0, C.r.down = 1*sin(5*theta.m), 
        cyclicBnd = 2, full.output=TRUE )
  dCONC <- tran$dC  - rr * CONC
  return (list(dCONC))
}

# solve to steady-state; cyclicBnd = 2, because of C.theta.up, C.theta.down
out <- steady.2D (y = rep(0, N*N), func = Diffpolar, parms = NULL,
                  dim = c(N, N), lrw = 1e6, cyclicBnd = 2)

image(out)

cart <- polar2cart(out, r = r, theta = theta, 
                        x = seq(-4, 4, len = 100), 
                        y = seq(-4, 4, len = 100))
image(cart)
          



