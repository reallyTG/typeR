library(deSolve)


### Name: ode.1D
### Title: Solver For Multicomponent 1-D Ordinary Differential Equations
### Aliases: ode.1D
### Keywords: math

### ** Examples


## =======================================================================
## example 1
## a predator and its prey diffusing on a flat surface
## in concentric circles
## 1-D model with using cylindrical coordinates
## Lotka-Volterra type biology
## =======================================================================

## ================
## Model equations
## ================

lvmod <- function (time, state, parms, N, rr, ri, dr, dri) {
  with (as.list(parms), {
    PREY <- state[1:N]
    PRED <- state[(N+1):(2*N)]

    ## Fluxes due to diffusion
    ## at internal and external boundaries: zero gradient
    FluxPrey <- -Da * diff(c(PREY[1], PREY, PREY[N]))/dri
    FluxPred <- -Da * diff(c(PRED[1], PRED, PRED[N]))/dri

    ## Biology: Lotka-Volterra model
    Ingestion     <- rIng  * PREY * PRED
    GrowthPrey    <- rGrow * PREY * (1-PREY/cap)
    MortPredator  <- rMort * PRED

    ## Rate of change = Flux gradient + Biology
    dPREY    <- -diff(ri * FluxPrey)/rr/dr   +
                GrowthPrey - Ingestion
    dPRED    <- -diff(ri * FluxPred)/rr/dr   +
                Ingestion * assEff - MortPredator

    return (list(c(dPREY, dPRED)))
  })
}

## ==================
## Model application
## ==================

## model parameters:

R  <- 20                        # total radius of surface, m
N  <- 100                       # 100 concentric circles
dr <- R/N                       # thickness of each layer
r  <- seq(dr/2,by = dr,len = N) # distance of center to mid-layer
ri <- seq(0,by = dr,len = N+1)  # distance to layer interface
dri <- dr                       # dispersion distances

parms <- c(Da     = 0.05,       # m2/d, dispersion coefficient
           rIng   = 0.2,        # /day, rate of ingestion
           rGrow  = 1.0,        # /day, growth rate of prey
           rMort  = 0.2 ,       # /day, mortality rate of pred
           assEff = 0.5,        # -, assimilation efficiency
           cap    = 10)         # density, carrying capacity

## Initial conditions: both present in central circle (box 1) only
state    <- rep(0, 2 * N)
state[1] <- state[N + 1] <- 10
                
## RUNNING the model:
times  <- seq(0, 200, by = 1)   # output wanted at these time intervals

## the model is solved by the two implemented methods:
## 1. Default: banded reformulation
print(system.time(
  out <- ode.1D(y = state, times = times, func = lvmod, parms = parms,
                nspec = 2, names = c("PREY", "PRED"),
                N = N, rr = r, ri = ri, dr = dr, dri = dri)
))

## 2. Using sparse method
print(system.time(
  out2 <- ode.1D(y = state, times = times, func = lvmod, parms = parms,
                 nspec = 2, names = c("PREY","PRED"), 
                 N = N, rr = r, ri = ri, dr = dr, dri = dri,
                 method = "lsodes")
))

## ================
## Plotting output
## ================
# the data in 'out' consist of: 1st col times, 2-N+1: the prey
# N+2:2*N+1: predators

PREY   <- out[, 2:(N + 1)]

filled.contour(x = times, y = r, PREY, color = topo.colors,
               xlab = "time, days", ylab = "Distance, m",
               main = "Prey density")
# similar:
image(out, which = "PREY", grid = r, xlab = "time, days", 
      legend = TRUE, ylab = "Distance, m", main = "Prey density")

image(out2, grid = r)

# summaries of 1-D variables
summary(out)

# 1-D plots:
matplot.1D(out, type = "l", subset = time == 10)
matplot.1D(out, type = "l", subset = time > 10 & time < 20)

## =======================================================================
## Example 2.
## Biochemical Oxygen Demand (BOD) and oxygen (O2) dynamics
## in a river
## =======================================================================

## ================
## Model equations
## ================
O2BOD <- function(t, state, pars) {
  BOD <- state[1:N]
  O2  <- state[(N+1):(2*N)]

  ## BOD dynamics
  FluxBOD <- v * c(BOD_0, BOD)   # fluxes due to water transport
  FluxO2  <- v * c(O2_0, O2)
  
  BODrate <- r * BOD             # 1-st order consumption

  ## rate of change = flux gradient  - consumption + reaeration (O2)
  dBOD         <- -diff(FluxBOD)/dx - BODrate
  dO2          <- -diff(FluxO2)/dx  - BODrate      +  p * (O2sat-O2)

  return(list(c(dBOD = dBOD, dO2 = dO2)))
}
 
 
## ==================
## Model application
## ==================
## parameters
dx      <- 25        # grid size of 25 meters
v       <- 1e3       # velocity, m/day
x       <- seq(dx/2, 5000, by = dx)  # m, distance from river
N       <- length(x)
r       <- 0.05      # /day, first-order decay of BOD
p       <- 0.5       # /day, air-sea exchange rate 
O2sat   <- 300       # mmol/m3 saturated oxygen conc
O2_0    <- 200       # mmol/m3 riverine oxygen conc
BOD_0   <- 1000      # mmol/m3 riverine BOD concentration

## initial conditions:
state <- c(rep(200, N), rep(200, N))
times <- seq(0, 20, by = 0.1)

## running the model
##  step 1  : model spinup
out <- ode.1D(y = state, times, O2BOD, parms = NULL, 
              nspec = 2, names = c("BOD", "O2"))

## ================
## Plotting output
## ================
## select oxygen (first column of out:time, then BOD, then O2
O2   <- out[, (N + 2):(2 * N + 1)]
color = topo.colors

filled.contour(x = times, y = x, O2, color = color, nlevels = 50,
               xlab = "time, days", ylab = "Distance from river, m",
               main = "Oxygen")
               
## or quicker plotting:
image(out, grid = x,  xlab = "time, days", ylab = "Distance from river, m")               



