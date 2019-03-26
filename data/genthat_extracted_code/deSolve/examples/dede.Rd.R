library(deSolve)


### Name: dede
### Title: General Solver for Delay Differential Equations.
### Aliases: dede
### Keywords: utilities

### ** Examples

## =============================================================================
## A simple delay differential equation
## dy(t) = -y(t-1) ; y(t<0)=1
## =============================================================================

##-----------------------------
## the derivative function
##-----------------------------
derivs <- function(t, y, parms) {
  if (t < 1)
    dy <- -1
  else
    dy <- - lagvalue(t - 1)
  list(c(dy))
}

##-----------------------------
## initial values and times
##-----------------------------
yinit <- 1
times <- seq(0, 30, 0.1)

##-----------------------------
## solve the model
##-----------------------------
yout <- dede(y = yinit, times = times, func = derivs, parms = NULL)

##-----------------------------
## display, plot results
##-----------------------------
plot(yout, type = "l", lwd = 2, main = "dy/dt = -y(t-1)")

## =============================================================================
## The infectuous disease model of Hairer; two lags.
## example 4 from Shampine and Thompson, 2000
## solving delay differential equations with dde23
## =============================================================================

##-----------------------------
## the derivative function
##-----------------------------
derivs <- function(t,y,parms) {
  if (t < 1)
    lag1 <- 0.1
  else
    lag1 <- lagvalue(t - 1,2)
  if (t < 10)
    lag10 <- 0.1
  else
    lag10 <- lagvalue(t - 10,2)

  dy1 <- -y[1] * lag1 + lag10
  dy2 <-  y[1] * lag1 - y[2]
  dy3 <-  y[2] - lag10
  list(c(dy1, dy2, dy3))
}

##-----------------------------
## initial values and times
##-----------------------------
yinit <- c(5, 0.1, 1)
times <- seq(0, 40, by = 0.1)

##-----------------------------
## solve the model
##-----------------------------
system.time(
  yout <- dede(y = yinit, times = times, func = derivs, parms = NULL)
)

##-----------------------------
## display, plot results
##-----------------------------
matplot(yout[,1], yout[,-1], type = "l", lwd = 2, lty = 1,
  main = "Infectuous disease - Hairer")

## =============================================================================
## time lags + EVENTS triggered by a root function
## The two-wheeled suitcase model
## example 8 from Shampine and Thompson, 2000
## solving delay differential equations with dde23
## =============================================================================

##-----------------------------
## the derivative function
##-----------------------------
derivs <- function(t, y, parms) {
  if (t < tau)
    lag <- 0
  else
    lag <- lagvalue(t - tau)

  dy1 <- y[2]
  dy2 <- -sign(y[1]) * gam * cos(y[1]) +
          sin(y[1]) - bet * lag[1] + A * sin(omega * t + mu)
  list(c(dy1, dy2))
}

## root and event function
root <- function(t,y,parms) ifelse(t>0, return(y), return(1))
event <- function(t,y,parms) return(c(y[1], y[2]*0.931))

gam = 0.248; bet = 1; tau = 0.1; A = 0.75
omega = 1.37; mu = asin(gam/A)

##-----------------------------
## initial values and times
##-----------------------------
yinit <- c(y = 0, dy = 0)
times <- seq(0, 12, len = 1000)

##-----------------------------
## solve the model
##-----------------------------
## Note: use a solver that supports both root finding and events,
##       e.g. lsodar, lsode, lsoda, adams, bdf
yout <- dede(y = yinit, times = times, func = derivs, parms = NULL,
  method = "lsodar", rootfun = root, events = list(func = event, root = TRUE))

##-----------------------------
## display, plot results
##-----------------------------

plot(yout, which = 1, type = "l", lwd = 2, main = "suitcase model", mfrow = c(1,2))
plot(yout[,2], yout[,3], xlab = "y", ylab = "dy", type = "l", lwd = 2)




