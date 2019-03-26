library(deSolve)


### Name: ode.band
### Title: Solver for Ordinary Differential Equations; Assumes a Banded
###   Jacobian
### Aliases: ode.band
### Keywords: math

### ** Examples


## =======================================================================
## The Aphid model from Soetaert and Herman, 2009.
## A practical guide to ecological modelling.
## Using R as a simulation platform. Springer.
## =======================================================================

## 1-D diffusion model

## ================
## Model equations
## ================
Aphid <- function(t, APHIDS, parameters) {
  deltax  <- c (0.5*delx, rep(delx, numboxes-1), 0.5*delx)
  Flux    <- -D*diff(c(0, APHIDS, 0))/deltax
  dAPHIDS <- -diff(Flux)/delx + APHIDS*r

  list(dAPHIDS)   # the output
}
  
## ==================
## Model application
## ==================

## the model parameters:
D         <- 0.3    # m2/day  diffusion rate
r         <- 0.01   # /day    net growth rate
delx      <- 1      # m       thickness of boxes
numboxes  <- 60 

## distance of boxes on plant, m, 1 m intervals
Distance  <- seq(from = 0.5, by = delx, length.out = numboxes)

## Initial conditions, ind/m2
## aphids present only on two central boxes
APHIDS        <- rep(0, times = numboxes)
APHIDS[30:31] <- 1
state         <- c(APHIDS = APHIDS)      # initialise state variables 
                  
## RUNNING the model:
times <- seq(0, 200, by = 1)   # output wanted at these time intervals
out   <- ode.band(state, times, Aphid, parms = 0, 
                  nspec = 1, names = "Aphid")

## ================
## Plotting output
## ================
image(out, grid = Distance, method = "filled.contour", 
      xlab = "time, days", ylab = "Distance on plant, m",
      main = "Aphid density on a row of plants")

matplot.1D(out, grid = Distance, type = "l", 
   subset = time %in% seq(0, 200, by = 10))

# add an observed dataset to 1-D plot (make sure to use correct name):
data <- cbind(dist  = c(0,10, 20,  30,  40, 50, 60), 
              Aphid = c(0,0.1,0.25,0.5,0.25,0.1,0))

matplot.1D(out, grid = Distance, type = "l", 
   subset = time %in% seq(0, 200, by = 10), 
   obs = data, obspar = list(pch = 18, cex = 2, col="red"))
## Not run: 
##D plot.1D(out, grid = Distance, type = "l")
##D 
## End(Not run)



