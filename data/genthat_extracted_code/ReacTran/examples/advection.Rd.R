library(ReacTran)


### Name: advection.1D
### Title: One-Dimensional Advection Equation
### Aliases: advection.1D advection.volume.1D
### Keywords: utilities

### ** Examples


## =============================================================================
## EXAMPLE 1: Testing the various methods - moving a square pulse  
## use of advection.1D
## The tests as in Pietrzak 
## =============================================================================

#--------------------#
# Model formulation  #
#--------------------#
model <- function (t, y, parms,...) {

  adv <- advection.1D(y, v = v, dx = dx, 
     C.up = y[n], C.down = y[1], ...)  # out on one side -> in at other
  return(list(adv$dC))

}

#--------------------#
# Parameters         #
#--------------------#

n     <- 100
dx    <- 100/n
y     <- c(rep(1, 5), rep(2, 20), rep(1, n-25))
v     <- 2 
times <- 0:300   # 3 times out and in

#--------------------#
# model solution     #
#--------------------#

## a plotting function
plotfun <- function (Out, ...) {
  plot(Out[1, -1], type = "l", col = "red", ylab = "y", xlab = "x", ...)
  lines(Out[nrow(Out), 2:(1+n)])
}

# courant number = 2
pm   <- par(mfrow = c(2, 2))

## third order TVD, quickest limiter
out <- ode.1D(y = y, times = times, func = model, parms = 0, hini = 1,
              method = "euler", nspec = 1, adv.method = "quick")

plotfun(out, main = "quickest, euler") 

## third-order ustream-biased polynomial
out2 <- ode.1D(y = y, times = times, func = model, parms = 0, hini = 1,
              method = "euler", nspec = 1, adv.method = "p3")

plotfun(out2, main = "p3, euler")

## third order TVD, superbee limiter
out3 <- ode.1D(y = y, times = times, func = model, parms = 0, hini = 1,
              method = "euler", nspec = 1, adv.method = "super")

plotfun(out3, main = "superbee, euler")

## third order TVD, muscl limiter
out4 <- ode.1D(y = y, times = times, func = model, parms = 0, hini = 1,
              method = "euler", nspec = 1, adv.method = "muscl")

plotfun(out4, main = "muscl, euler")

## =============================================================================
## upstream, different time-steps , i.e. different courant number
## =============================================================================
out <- ode.1D(y = y, times = times, func = model, parms = 0, 
              method = "euler", nspec = 1, adv.method = "up")

plotfun(out, main = "upstream, courant number = 2")

out2 <- ode.1D(y = y, times = times, func = model, parms = 0, hini = 0.5,  
               method = "euler", nspec = 1, adv.method = "up")
plotfun(out2, main = "upstream, courant number = 1")


## Now muscl scheme, velocity against x-axis
y     <- rev(c(rep(0, 5), rep(1, 20), rep(0, n-25)))
v     <- -2.0
out6 <- ode.1D(y = y, times = times, func = model, parms = 0, hini = 1,
               method = "euler", nspec = 1, adv.method = "muscl")

plotfun(out6, main = "muscl, reversed velocity, , courant number = 1")

image(out6, mfrow = NULL)
par(mfrow = pm)


## =============================================================================
## EXAMPLE 2: moving a square pulse in a widening river  
## use of advection.volume.1D
## =============================================================================

#--------------------#
# Model formulation  #
#--------------------#

river.model <- function (t=0, C, pars = NULL, ...)  {

 tran <- advection.volume.1D(C = C, C.up = 0,
                     flow = flow, V = Volume,...)
 return(list(dCdt = tran$dC, F.down = tran$F.down, F.up = tran$F.up))
}

#--------------------#
# Parameters         #
#--------------------#

# Initialising morphology river:

nbox          <- 100                # number of grid cells
lengthRiver   <- 100000             # [m]
BoxLength     <- lengthRiver / nbox # [m]

Distance      <- seq(BoxLength/2, by = BoxLength, len = nbox)   # [m]

# Cross sectional area: sigmoid function of distance [m2]
CrossArea <- 4000 + 72000 * Distance^5 /(Distance^5+50000^5)

# Volume of boxes                          (m3)
Volume    <- CrossArea*BoxLength

# Transport coefficients
flow      <- 1000*24*3600   # m3/d, main river upstream inflow

#--------------------#
# Model solution     #
#--------------------#

pm   <- par(mfrow=c(2,2))

# a square pulse
yini <-  c(rep(10, 10), rep(0, nbox-10))

## third order TVD, muscl limiter
Conc <- ode.1D(y = yini, fun = river.model,  method = "euler", hini = 1,
              parms = NULL, nspec = 1, times = 0:40, adv.method = "muscl")

image(Conc, main = "muscl", mfrow = NULL)
plot(Conc[30, 2:(1+nbox)], type = "l", lwd = 2, xlab = "x", ylab = "C", 
     main = "muscl after 30 days")

## simple upstream differencing
Conc2<- ode.1D(y = yini, fun = river.model, method = "euler", hini = 1,
              parms = NULL, nspec = 1, times = 0:40, adv.method = "up")

image(Conc2, main = "upstream", mfrow = NULL)
plot(Conc2[30, 2:(1+nbox)], type = "l", lwd = 2, xlab = "x", ylab = "C", 
     main = "upstream after 30 days")

par(mfrow = pm)


# Note: the more sophisticated the scheme, the more mass lost/created
# increase tolerances to improve this.

CC <- Conc[ , 2:(1+nbox)]
MASS <- t(CC)*Volume     
colSums(MASS)

## =============================================================================
## EXAMPLE 3: A steady-state solution 
## use of advection.volume.1D
## =============================================================================

Sink <- function (t, y, parms, ...) {
  C1 <- y[1:N]
  C2 <- y[(N+1):(2*N)]
  C3 <- y[(2*N+1):(3*N)]
  # Rate of change= Flux gradient and first-order consumption                  
  
  # upstream can be implemented in two ways:
 
  dC1  <- advection.1D(C1, v = sink, dx = dx, 
           C.up = 100, adv.method = "up", ...)$dC - decay*C1

# same, using tran.1D  
#  dC1  <- tran.1D(C1, v = sink, dx = dx, 
#        C.up = 100, D = 0)$dC -
#           decay*C1

  dC2  <- advection.1D(C2, v = sink, dx = dx, 
        C.up = 100, adv.method = "p3", ...)$dC -
           decay*C2

  dC3  <- advection.1D(C3, v = sink, dx = dx, 
        C.up = 100, adv.method = "muscl", ...)$dC -
           decay*C3

  list(c(dC1, dC2, dC3))
}

N     <- 10
L     <- 1000
dx    <- L/N                          # thickness of boxes
sink  <- 10
decay <- 0.1
out <- steady.1D(runif(3*N), func = Sink, names = c("C1", "C2", "C3"),
        parms = NULL, nspec = 3, bandwidth = 2)
matplot(out$y, 1:N, type = "l", ylim = c(10, 0), lwd = 2, 
  main = "Steady-state")          
legend("bottomright", col = 1:3, lty = 1:3, 
  c("upstream", "p3", "muscl"))





