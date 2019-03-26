library(ReacTran)


### Name: fiadeiro
### Title: Advective Finite Difference Weights
### Aliases: fiadeiro
### Keywords: utilities

### ** Examples

#============================================
# Model formulation (differential equations)
#============================================

# This is a test model to evaluate the different finite difference schemes 
# and evaluate their effect on munerical diffusion. The model describes the
# decay of organic carbon (OC) as it settles through the ocean water column.

model <- function (time, OC, pars, AFDW = 1) {
  dOC <- tran.1D(OC, flux.up = F_OC, D = D.eddy, 
                 v = v.sink, AFDW = AFDW, dx = dx)$dC - k*OC
  return(list(dOC))
}
#============================================
# Parameter set
#============================================

L <- 1000         # water depth model domain [m]
x.att <- 200      # attenuation depth of the sinking velocity [m]
v.sink.0 <- 10    # sinking velocity at the surface [m d-1]
D.eddy <- 10      # eddy diffusion coefficient [m2 d-1]
F_OC <- 10        # particle flux [mol m-2 d-1]
k <- 0.1          # decay coefficient [d-1]

## =============================================================================
## Model solution for a coarse grid (10 grid cells)
## =============================================================================

# Setting up the grid
N <- 10                               # number of grid layers 
dx <- L/N                             # thickness of boxes [m]
dx.aux <- rep(dx, N+1)                # auxilliary grid vector
x.int <- seq(from = 0, to = L, by = dx)    # water depth at box interfaces [m]
x.mid <- seq(from = dx/2, to = L, by = dx) # water depth at box centres [m]

# Exponentially declining sink velocity
v.sink <- v.sink.0 * exp(-x.int/x.att) # sink velocity [m d-1]
Pe <- v.sink * dx/D.eddy               # Peclet number

# Calculate the weighing coefficients
AFDW <- fiadeiro(v = v.sink, D = D.eddy, dx.aux = dx.aux)

par(mfrow = c(2, 1), cex.main = 1.2, cex.lab = 1.2)

# Plot the Peclet number over the grid 

plot(Pe, x.int, log = "x", pch = 19, ylim = c(L,0), xlim = c(0.1, 1000), 
     xlab = "", ylab = "depth [m]", 
     main = "Peclet number", axes = FALSE)
abline(h = 0)
axis(pos = NA, side = 2)
axis(pos = 0, side = 3)

# Plot the AFDW coefficients over the grid 

plot(AFDW, x.int, pch = 19, ylim = c(L, 0), xlim = c(0.5, 1), 
     xlab = "", ylab = "depth [m]", main = "AFDW coefficient", axes = FALSE)
abline(h = 0)
axis(pos = NA, side = 2)
axis(pos = 0, side = 3)

# Three steady-state solutions for a coarse grid based on:
# (1) backward differences (BD)
# (2) central differences (CD)
# (3) Fiadeiro & Veronis scheme (FV)

BD <- steady.1D(y = runif(N), func = model, AFDW = 1.0, nspec = 1)
CD <- steady.1D(y = runif(N), func = model, AFDW = 0.5, nspec = 1)
FV <- steady.1D(y = runif(N), func = model, AFDW = AFDW, nspec = 1)

# Plotting output - use rootSolve's plot method
plot(BD, CD, FV, grid = x.mid, xyswap = TRUE, mfrow = c(1,2), 
     xlab = "", ylab = "depth [m]", main = "conc (Low resolution grid)")

legend("bottomright", col = 1:3, lty = 1:3,
       legend = c("backward diff", "centred diff", "Fiadeiro&Veronis"))


## =============================================================================
## Model solution for a fine grid (1000 grid cells)
## =============================================================================

# Setting up the grid
N <- 1000                            # number of grid layers 
dx <- L/N                            # thickness of boxes[m]
dx.aux <- rep(dx, N+1)              # auxilliary grid vector
x.int <- seq(from = 0, to = L, by = dx)      # water depth at box interfaces [m]
x.mid <- seq(from = dx/2, to = L, by = dx)   # water depth at box centres [m]

# Exponetially declining sink velocity
v.sink <- v.sink.0 * exp(-x.int/x.att) # sink velocity [m d-1]
Pe <- v.sink * dx/D.eddy               # Peclet number

# Calculate the weighing coefficients
AFDW <- fiadeiro(v = v.sink, D = D.eddy, dx.aux = dx.aux)

# Three steady-state solutions for a coarse grid based on:
# (1) backward differences (BD)
# (2) centered differences (CD)
# (3) Fiadeiro & Veronis scheme (FV)

BD <- steady.1D(y = runif(N), func = model, AFDW = 1.0, nspec = 1)
CD <- steady.1D(y = runif(N), func = model, AFDW = 0.5, nspec = 1)
FV <- steady.1D(y = runif(N), func = model, AFDW = AFDW, nspec = 1)

# Plotting output
plot(BD, CD, FV, grid = x.mid, xyswap = TRUE, mfrow = NULL, 
     xlab = "", ylab = "depth [m]", main = "conc (High resolution grid)")

legend("bottomright", col = 1:3, lty = 1:3,
       legend = c("backward diff", "centred diff", "Fiadeiro&Veronis"))

# Results and conclusions:
# - For the fine grid, all three solutions are identical
# - For the coarse grid, the BD and FV solutions show numerical dispersion
#   while the CD provides more accurate results



