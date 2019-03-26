library(ReacTran)


### Name: tran.1D
### Title: General One-Dimensional Advective-Diffusive Transport
### Aliases: tran.1D
### Keywords: utilities

### ** Examples

## =============================================================================
## EXAMPLE 1: O2 and OC consumption in sediments
## =============================================================================

# this example uses only the volume fractions 
# in the reactive transport term

#====================#
# Model formulation  #
#====================#

# Monod consumption of oxygen (O2)

O2.model <- function (t = 0, O2, pars = NULL) {

  tran <- tran.1D(C = O2, C.up = C.ow.O2, D = D.grid, 
                  v = v.grid, VF = por.grid, dx = grid)$dC
  reac <- - R.O2*(O2/(Ks+O2))
  return(list(dCdt = tran + reac))
}

# First order consumption of organic carbon (OC)

OC.model <- function (t = 0, OC, pars = NULL) {

  tran <- tran.1D(C = OC, flux.up = F.OC, D = Db.grid,
                  v = v.grid, VF = svf.grid, dx = grid)$dC
  reac <- - k*OC
  return(list(dCdt = tran + reac))
}

#======================#
# Parameter definition #
#======================#

# Parameter values

F.OC    <- 25    # input flux organic carbon [micromol cm-2 yr-1]
C.ow.O2 <- 0.25  # concentration O2 in overlying water [micromol cm-3]
por     <- 0.8   # porosity
D       <- 400   # diffusion coefficient O2 [cm2 yr-1]
Db      <- 10    # mixing coefficient sediment [cm2 yr-1]
v       <- 1     # advective velocity [cm yr-1]
k       <- 1     # decay constant organic carbon [yr-1]
R.O2    <- 10    # O2 consumption rate [micromol cm-3 yr-1]
Ks      <- 0.005 # O2 consumption saturation constant 

# Grid definition

L <- 10   # depth of sediment domain [cm]
N <- 100  # number of grid layers
grid <- setup.grid.1D(x.up = 0, L = L, N = N)

# Volume fractions 

por.grid <- setup.prop.1D(value = por, grid = grid)
svf.grid <- setup.prop.1D(value = (1-por), grid = grid)
D.grid   <- setup.prop.1D(value = D, grid = grid)
Db.grid  <- setup.prop.1D(value = Db, grid = grid)
v.grid   <- setup.prop.1D(value = v, grid = grid)

#====================#
# Model solution     #
#====================#

# Initial conditions + simulation O2

yini <- rep(0, length.out = N) 
O2   <- steady.1D(y = yini, func = O2.model, nspec = 1)

# Initial conditions + simulation OC

yini <- rep(0, length.out = N) 
OC   <- steady.1D(y = yini, func = OC.model, nspec = 1)

# Plotting output, using S3 plot method of package rootSolve"

plot(O2, grid = grid$x.mid, xyswap = TRUE, main = "O2 concentration", 
     ylab = "depth [cm]", xlab = "", mfrow = c(1,2), type = "p", pch = 16)

plot(OC, grid = grid$x.mid, xyswap = TRUE, main = "C concentration", 
     ylab = "depth [cm]", xlab = "", mfrow = NULL)

## =============================================================================
## EXAMPLE 2: O2 in a cylindrical and spherical organism
## =============================================================================

# This example uses only the surface areas 
# in the reactive transport term

#====================#
# Model formulation  #
#====================#

# the numerical model - rate of change = transport-consumption
Cylinder.Model <- function(time, O2, pars)
  return (list(
    tran.1D(C = O2, C.down = BW, D = Da, A = A.cyl, dx = dx)$dC - Q
    ))

Sphere.Model <- function(time, O2, pars)
  return (list(
    tran.1D(C = O2, C.down = BW, D = Da, A = A.sphere, dx = dx)$dC - Q
    ))

#======================#
# Parameter definition #
#======================#

# parameter values

BW     <- 2      # mmol/m3,  oxygen conc in surrounding water
Da     <- 0.5    # cm2/d     effective diffusion coeff in organism
R      <- 0.0025 # cm        radius of organism
Q      <- 250000 # nM/cm3/d  oxygen consumption rate/ volume / day
L      <- 0.05   # cm        length of organism (if a cylinder)

# the numerical model

N  <- 40                              # layers in the body
dx <- R/N                             # thickness of each layer
x.mid <- seq(dx/2, by = dx, length.out = N) # distance of center to mid-layer
x.int <- seq(0, by = dx, length.out = N+1)  # distance to layer interface

# Cylindrical surfaces
A.cyl   <- 2*pi*x.int*L  # surface at mid-layer depth

# Spherical surfaces
A.sphere <- 4*pi*x.int^2 # surface of sphere, at each mid-layer

#====================#
# Model solution     #
#====================#

# the analytical solution of cylindrical and spherical model
cylinder <- function(Da, Q, BW, R, r)  BW + Q/(4*Da)*(r^2-R^2)
sphere   <- function(Da, Q, BW, R, r)  BW + Q/(6*Da)*(r^2-R^2)

# solve the model numerically for a cylinder
O2.cyl <- steady.1D (y = runif(N), name = "O2", 
      func = Cylinder.Model, nspec = 1, atol = 1e-10)

# solve the model numerically for a sphere
O2.sphere <- steady.1D (y = runif(N), name = "O2", 
      func = Sphere.Model, nspec = 1, atol = 1e-10)

#====================#
# Plotting output    #
#====================#
# Analytical solution - "observations"
Ana.cyl   <- cbind(x.mid, O2 = cylinder(Da, Q, BW, R, x.mid))
Ana.spher <- cbind(x.mid, O2 = sphere(Da, Q, BW, R, x.mid))

plot(O2.cyl, O2.sphere, grid = x.mid, lwd = 2, lty = 1, col = 1:2, 
     xlab = "distance from centre, cm", 
     ylab = "mmol/m3", main = "tran.1D",
     sub = "diffusion-reaction in a cylinder and sphere",
     obs = list(Ana.cyl, Ana.spher), obspar = list(pch = 16, col =1:2))
     
legend ("topleft", lty = c(1, NA), pch = c(NA, 18),
        c("numerical approximation", "analytical solution"))
legend ("bottomright", pch = 16, lty = 1, col = 1:2,
        c("cylinder", "sphere"))

## =============================================================================
## EXAMPLE 3: O2 consumption in a spherical aggregate
## =============================================================================

# this example uses both the surface areas and the volume fractions
# in the reactive transport term

#====================#
# Model formulation  #
#====================#

Aggregate.Model <- function(time, O2, pars) {

  tran <- tran.1D(C = O2, C.down = C.ow.O2,
                  D = D.grid, A = A.grid,
                  VF = por.grid, dx = grid )$dC

  reac <- - R.O2*(O2/(Ks+O2))*(O2>0)
  return(list(dCdt = tran + reac, consumption = -reac))

}

#======================#
# Parameter definition #
#======================#

# Parameters

C.ow.O2 <- 0.25     # concentration O2 water [micromol cm-3]
por     <- 0.8      # porosity
D       <- 400      # diffusion coefficient O2 [cm2 yr-1]
v       <- 0        # advective velocity [cm yr-1]
R.O2    <- 1000000  # O2 consumption rate [micromol cm-3 yr-1]
Ks      <- 0.005    # O2 saturation constant [micromol cm-3]

# Grid definition
R <- 0.025           # radius of the agggregate [cm]
N <- 100             # number of grid layers
grid <- setup.grid.1D(x.up = 0, L = R, N = N)

# Volume fractions 

por.grid <- setup.prop.1D(value = por, grid = grid)
D.grid   <- setup.prop.1D(value = D, grid = grid)

# Surfaces 

A.mid <- 4*pi*grid$x.mid^2  # surface of sphere at middle of grid cells
A.int <- 4*pi*grid$x.int^2  # surface of sphere at interface
A.grid <- list(int = A.int, mid = A.mid)

#====================#
# Model solution     #
#====================#

# Numerical solution: staedy state 

O2.agg <- steady.1D (runif(N), func = Aggregate.Model, nspec = 1,
                     atol = 1e-10, names = "O2")

#====================#
# Plotting output    #
#====================#

par(mfrow = c(1,1))

plot(grid$x.mid, O2.agg$y, xlab = "distance from centre, cm",
     ylab = "mmol/m3",
     main = "Diffusion-reaction of O2 in a spherical aggregate")
legend ("bottomright", pch = c(1, 18), lty = 1, col = "black",
        c("O2 concentration"))

# Similar, using S3 plot method of package rootSolve"
plot(O2.agg, grid = grid$x.mid, which = c("O2", "consumption"),
     xlab = "distance from centre, cm", ylab = c("mmol/m3","mmol/m3/d")) 




