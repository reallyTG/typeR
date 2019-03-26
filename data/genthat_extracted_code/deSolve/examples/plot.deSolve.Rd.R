library(deSolve)


### Name: plot.deSolve
### Title: Plot, Image and Histogram Method for deSolve Objects
### Aliases: plot.deSolve plot.1D matplot.0D matplot.deSolve matplot.1D
###   hist.deSolve image.deSolve subset.deSolve
### Keywords: hplot

### ** Examples

## =======================================================================
## Example 1. A Predator-Prey model with 4 species in matrix formulation
## =======================================================================

LVmatrix <- function(t, n, parms) {
  with(parms, {
    dn <- r * n + n * (A %*% n)
    return(list(c(dn)))
  })
}
parms <- list(
  r = c(r1 = 0.1, r2 = 0.1, r3 = -0.1, r4 = -0.1),
  A = matrix(c(0.0, 0.0, -0.2, 0.01,      # prey 1
               0.0, 0.0, 0.02, -0.1,      # prey 2
               0.2, 0.02, 0.0, 0.0,       # predator 1; prefers prey 1
               0.01, 0.1, 0.0, 0.0),      # predator 2; prefers prey 2
               nrow = 4, ncol = 4, byrow=TRUE)
)
times <- seq(from = 0, to = 500, by = 0.1)
y     <- c(prey1 = 1, prey2 = 1, pred1 = 2, pred2 = 2)

out <- ode(y, times, LVmatrix, parms)

## Basic line plot
plot(out, type = "l")

## User-specified axis labels
plot(out, type = "l", ylab = c("Prey 1", "Prey 2", "Pred 1", "Pred 2"),
  xlab = "Time (d)", main = "Time Series")

## Set user-defined mfrow
pm <- par (mfrow = c(2, 2))

## "mfrow=NULL" keeps user-defined mfrow
plot(out, which = c("prey1", "pred2"), mfrow = NULL, type = "l", lwd = 2)

plot(out[,"prey1"], out[,"pred1"], xlab="prey1",
  ylab = "pred1", type = "l", lwd = 2)
plot(out[,"prey2"], out[,"pred2"], xlab = "prey2",
  ylab = "pred2", type = "l",lwd = 2)

## restore graphics parameters
par ("mfrow" = pm)

## Plot all in one figure, using matplot
matplot.0D(out, lwd = 2)

## Split y-variables in two groups
matplot.0D(out, which = list(c(1,3), c(2,4)), lty = 1,
  ylab = c("prey1,pred1", "prey2,pred2"))

## =======================================================================
## Example 2. Add second and third output, and observations
## =======================================================================

# New runs with different parameter settings
parms2      <- parms
parms2$r[1] <- 0.2
out2 <- ode(y, times, LVmatrix, parms2)

# New runs with different parameter settings
parms3      <- parms
parms3$r[1] <- 0.05
out3 <- ode(y, times, LVmatrix, parms3)

# plot all three outputs
plot(out, out2, out3, type = "l",
  ylab = c("Prey 1", "Prey 2", "Pred 1", "Pred 2"),
  xlab = "Time (d)", main = "Time Series",
  col = c("red", "blue", "darkred"))


## 'observed' data
obs <- as.data.frame(out[out[,1] %in% seq(10, 500, by = 30), ])

plot(out, which = "prey1", type = "l", obs = obs,
     obspar = list(pch = 18, cex = 2))

plot(out, type = "l", obs = obs, col = "red")

matplot.0D(out, which = c("prey1", "pred1"), type = "l", obs = obs)

## second set of 'observed' data and two outputs
obs2 <- as.data.frame(out2[out2[,1] %in% seq(10, 500, by = 50), ])

## manual xlim, log
plot(out, out2, type = "l", obs = list(obs, obs2), col = c("red", "blue"),
      obspar = list(pch = 18:19, cex = 2, col = c("red", "blue")),
      log = c("y", ""), which = c("prey1", "prey1"),
      xlim = list(c(100, 500), c(0, 400)))

## data in 'long' format
OBS <- data.frame(name = c(rep("prey1", 3), rep("prey2", 2)),
                  time = c(10, 100, 250, 10, 400),
                  value = c(0.05, 0.04, 0.7, 0.5, 1))
OBS
plot(out, obs = OBS, obspar = c(pch = 18, cex = 2))

# a subset only:
plot(out, subset = prey1 < 0.5, type = "p")

# Simple histogram
hist(out, col = "darkblue", breaks = 50)

hist(out, col = "darkblue", breaks = 50, subset = prey1<1 & prey2 < 1)

# different parameters per plot
hist(out, col = c("darkblue", "red", "orange", "black"),
     breaks = c(10,50))

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
  deltax  <- c (0.5*delx, rep(delx, numboxes - 1), 0.5*delx)
  Flux    <- -D * diff(c(0, APHIDS, 0))/deltax
  dAPHIDS <- -diff(Flux)/delx + APHIDS * r
  list(dAPHIDS, Flux = Flux)
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
out   <- ode.1D(state, times, Aphid, parms = 0, nspec = 1, names = "Aphid")

image(out, grid = Distance, main = "Aphid model", ylab = "distance, m",
  legend = TRUE)

## restricting time
image(out, grid = Distance, main = "Aphid model", ylab = "distance, m",
  legend = TRUE, subset = time < 100)

image(out, grid = Distance, main = "Aphid model", ylab = "distance, m",
  method = "persp", border = NA, theta = 30)

FluxAphid <- subset(out, select = "Flux", subset = time < 50)

matplot.1D(out, type = "l", lwd = 2, xyswap = TRUE, lty = 1)

matplot.1D(out, type = "l", lwd = 2, xyswap = TRUE, lty = 1,
           subset = time < 50)

matplot.1D(out, type = "l", lwd = 2, xyswap = TRUE, lty = 1,
           subset = time %in% seq(0, 200, by = 10), col = "grey")

## Not run: 
##D   plot(out, ask = FALSE, mfrow = c(1, 1))
##D   plot.1D(out, ask = FALSE, type = "l", lwd = 2, xyswap = TRUE)
## End(Not run)

## see help file for ode.2D for images of 2D variables



