library(ReacTran)


### Name: tran.2D
### Title: General Two-Dimensional Advective-Diffusive Transport
### Aliases: tran.2D
### Keywords: utilities

### ** Examples

## =============================================================================
## Testing the functions
## =============================================================================
# Parameters
F        <- 100             # input flux [micromol cm-2 yr-1]
por      <- 0.8             # constant porosity
D        <- 400             # mixing coefficient [cm2 yr-1]
v        <- 1               # advective velocity [cm yr-1]

# Grid definition
x.N <- 4   # number of cells in x-direction
y.N <- 6   # number of cells in y-direction
x.L <- 8   # domain size x-direction [cm]
y.L <- 24  # domain size y-direction [cm]
dx  <- x.L/x.N             # cell size x-direction [cm]
dy  <- y.L/y.N             # cell size y-direction [cm]
 
# Intial conditions 
C <- matrix(nrow = x.N, ncol = y.N, data = 0, byrow = FALSE)

# Boundary conditions: fixed concentration  
C.x.up   <- rep(1, times = y.N)
C.x.down <- rep(0, times = y.N)
C.y.up   <- rep(1, times = x.N)
C.y.down <- rep(0, times = x.N)

# Only diffusion 
tran.2D(C = C, D.x = D, D.y = D, v.x = 0, v.y = 0,
  VF.x = por, VF.y = por, dx = dx, dy = dy,
  C.x.up = C.x.up, C.x.down = C.x.down,
  C.y.up = C.y.up, C.y.down = C.y.down, full.output = TRUE)

# Strong advection, backward (default), central and forward 
#finite difference schemes 
tran.2D(C = C, D.x = D, v.x = 100*v, 
  VF.x = por, dx = dx, dy = dy,
  C.x.up = C.x.up, C.x.down = C.x.down, 
  C.y.up = C.y.up, C.y.down = C.y.down)
  
tran.2D(AFDW.x = 0.5, C = C, D.x = D, v.x = 100*v, 
  VF.x = por, dx = dx, dy = dy,
  C.x.up = C.x.up, C.x.down = C.x.down, 
  C.y.up = C.y.up, C.y.down = C.y.down)

tran.2D(AFDW.x = 0, C = C, D.x = D, v.x = 100*v, 
  VF.x = por, dx = dx, dy = dy,
  C.x.up = C.x.up, C.x.down = C.x.down, 
  C.y.up = C.y.up, C.y.down = C.y.down)

# Boundary conditions: fixed fluxes 

flux.x.up <- rep(200, times = y.N)
flux.x.down <- rep(-200, times = y.N)
flux.y.up <- rep(200, times = x.N)
flux.y.down <- rep(-200, times = x.N)
tran.2D(C = C, D.x = D, v.x = 0, 
  VF.x = por, dx = dx, dy = dy,
  flux.x.up = flux.x.up, flux.x.down = flux.x.down,
  flux.y.up = flux.y.up, flux.y.down = flux.y.down)

# Boundary conditions: convective boundary layer on all sides

a.bl <- 800   # transfer coefficient
C.x.up <- rep(1, times = (y.N)) # fixed conc at boundary layer
C.y.up <- rep(1, times = (x.N)) # fixed conc at boundary layer
tran.2D(full.output = TRUE, C = C, D.x = D, v.x = 0, 
  VF.x = por, dx = dx, dy = dy, 
  C.x.up   = C.x.up, a.bl.x.up = a.bl, 
  C.x.down = C.x.up, a.bl.x.down = a.bl, 
  C.y.up   = C.y.up, a.bl.y.up = a.bl,
  C.y.down = C.y.up, a.bl.y.down = a.bl)

# Runtime test with and without argument checking

n.iterate <-500

test1 <- function() {
  for (i in 1:n.iterate )
    ST <- tran.2D(full.check = TRUE, C = C, D.x = D, 
      v.x = 0, VF.x = por, dx = dx, dy = dy,
      C.x.up = C.x.up, a.bl.x.up = a.bl, C.x.down = C.x.down)
} 
system.time(test1())

test2 <- function() {
  for (i in 1:n.iterate )
    ST <- tran.2D(full.output = TRUE, C = C, D.x = D, 
      v.x = 0, VF.x = por, dx = dx, dy = dy,
      C.x.up = C.x.up, a.bl.x.up = a.bl, C.x.down = C.x.down)
} 
system.time(test2())

test3 <- function() {
  for (i in 1:n.iterate )
    ST <- tran.2D(full.output = TRUE, full.check = TRUE, C = C,
      D.x = D, v.x = 0, VF.x = por, dx = dx, dy = dy,
      C.x.up = C.x.up, a.bl.x.up = a.bl, C.x.down = C.x.down)
} 
system.time(test3())

## =============================================================================
## A 2-D model with diffusion in x- and y direction and first-order
## consumption - unefficient implementation
## =============================================================================

N     <- 51          # number of grid cells
XX    <- 10           # total size
dy    <- dx <- XX/N  # grid size
Dy    <- Dx <- 0.1   # diffusion coeff, X- and Y-direction
r     <- 0.005       # consumption rate
ini   <- 1           # initial value at x=0

N2  <- ceiling(N/2)
X   <- seq (dx, by = dx, len = (N2-1))
X   <- c(-rev(X), 0, X)

# The model equations

Diff2D <- function (t, y, parms)  {

 CONC  <- matrix(nrow = N, ncol = N, y)
 dCONC <- tran.2D(CONC, D.x = Dx, D.y = Dy, dx = dx, dy = dy)$dC + r * CONC

 return (list(dCONC))

}

# initial condition: 0 everywhere, except in central point
y <- matrix(nrow = N, ncol = N, data = 0)
y[N2, N2] <- ini  # initial concentration in the central point...

# solve for 10 time units
times <- 0:10
out <- ode.2D (y = y, func = Diff2D, t = times, parms = NULL,
                dim = c(N,N), lrw = 160000)

pm <- par (mfrow = c(2, 2))

# Compare solution with analytical solution...
for (i in seq(2, 11, by = 3))  {
  tt   <- times[i]
  mat  <-  matrix(nrow = N, ncol = N, 
                  data = subset(out, time == tt))
  plot(X, mat[N2,], type = "l", main = paste("time=", times[i]),
       ylab = "Conc", col = "red")
  ana <- ini*dx^2/(4*pi*Dx*tt)*exp(r*tt-X^2/(4*Dx*tt))
  points(X, ana, pch = "+")
}

legend ("bottom", col = c("red","black"), lty = c(1, NA), 
  pch = c(NA, "+"), c("tran.2D", "exact"))
par("mfrow" = pm )



## =============================================================================
## A 2-D model with diffusion in x- and y direction and first-order
## consumption - more efficient implementation, specifying ALL 2-D grids
## =============================================================================

N     <- 51          # number of grid cells
Dy    <- Dx <- 0.1   # diffusion coeff, X- and Y-direction
r     <- 0.005       # consumption rate
ini   <- 1           # initial value at x=0

x.grid    <- setup.grid.1D(x.up = -5, x.down = 5, N = N)
y.grid    <- setup.grid.1D(x.up = -5, x.down = 5, N = N)
grid2D    <- setup.grid.2D(x.grid, y.grid)

D.grid    <- setup.prop.2D(value = Dx, y.value = Dy, grid = grid2D)
v.grid    <- setup.prop.2D(value = 0, grid = grid2D)
A.grid    <- setup.prop.2D(value = 1, grid = grid2D)
AFDW.grid <- setup.prop.2D(value = 1, grid = grid2D)
VF.grid   <- setup.prop.2D(value = 1, grid = grid2D)

# The model equations - using the grids

Diff2Db <- function (t, y, parms)  {

   CONC  <- matrix(nrow = N, ncol = N, data = y)

   dCONC <- tran.2D(CONC, grid = grid2D, D.grid = D.grid, 
      A.grid = A.grid, VF.grid = VF.grid, AFDW.grid = AFDW.grid, 
      v.grid = v.grid)$dC + r * CONC
  
  return (list(dCONC))
}

# initial condition: 0 everywhere, except in central point
y <- matrix(nrow = N, ncol = N, data = 0)
y[N2,N2] <- ini  # initial concentration in the central point...

# solve for 8 time units
times <- 0:8
outb <- ode.2D (y = y, func = Diff2Db, t = times, parms = NULL,
                dim = c(N, N), lrw = 160000)

image(outb, ask = FALSE, mfrow = c(3, 3), main = paste("time", times))

## =============================================================================
## Same 2-D model, but now with spatially-variable diffusion coefficients
## =============================================================================

N     <- 51          # number of grid cells
r     <- 0.005       # consumption rate
ini   <- 1           # initial value at x=0
N2    <- ceiling(N/2)

D.grid <- list()

# Diffusion on x-interfaces
D.grid$x.int <- matrix(nrow = N+1, ncol = N, data = runif(N*(N+1)))

# Diffusion on y-interfaces
D.grid$y.int <- matrix(nrow = N, ncol = N+1, data = runif(N*(N+1)))

dx <- 10/N
dy <- 10/N

# The model equations

Diff2Dc <- function (t, y, parms)  {

   CONC  <- matrix(nrow = N, ncol = N, data = y)

   dCONC <- tran.2D(CONC, dx = dx, dy = dy, D.grid = D.grid)$dC + r * CONC

  return (list(dCONC))
}

# initial condition: 0 everywhere, except in central point
y <- matrix(nrow = N, ncol = N, data = 0)
y[N2, N2] <- ini  # initial concentration in the central point...

# solve for 8 time units
times <- 0:8
outc <- ode.2D (y = y, func = Diff2Dc, t = times, parms = NULL,
                dim = c(N, N), lrw = 160000)

outtimes <- c(1, 3, 5, 7)
image(outc, ask = FALSE, mfrow = c(2, 2), main = paste("time", outtimes),
      legend = TRUE, add.contour = TRUE, subset = time %in% outtimes)




