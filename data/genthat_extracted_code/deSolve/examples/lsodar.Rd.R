library(deSolve)


### Name: lsodar
### Title: Solver for Ordinary Differential Equations (ODE), Switching
###   Automatically Between Stiff and Non-stiff Methods and With Root
###   Finding
### Aliases: lsodar
### Keywords: math

### ** Examples

## =======================================================================
## Example 1:
##   from lsodar source code
## =======================================================================

Fun <- function (t, y, parms) {
  ydot <- vector(len = 3)
  ydot[1] <- -.04*y[1] + 1.e4*y[2]*y[3]
  ydot[3] <- 3.e7*y[2]*y[2]
  ydot[2] <- -ydot[1] - ydot[3]
  return(list(ydot, ytot = sum(y)))
}

rootFun <- function (t, y, parms) {
  yroot <- vector(len = 2)
  yroot[1] <- y[1] - 1.e-4
  yroot[2] <- y[3] - 1.e-2
  return(yroot)
}

y     <- c(1, 0, 0)
times <- c(0, 0.4*10^(0:8))
Out   <- NULL
ny    <- length(y)

out   <- lsodar(y = y, times = times, fun = Fun, rootfun = rootFun,
                rtol = 1e-4, atol = c(1e-6, 1e-10, 1e-6), parms = NULL)
print(paste("root is found for eqn", which(attributes(out)$iroot == 1)))
print(out[nrow(out),])

diagnostics(out)
  
## =======================================================================
## Example 2:
##   using lsodar to estimate steady-state conditions
## =======================================================================

## Bacteria (Bac) are growing on a substrate (Sub)
model <- function(t, state, pars) {
  with (as.list(c(state, pars)), {
    ##        substrate uptake             death     respiration
    dBact <-  gmax*eff*Sub/(Sub+ks)*Bact - dB*Bact - rB*Bact
    dSub  <- -gmax    *Sub/(Sub+ks)*Bact + dB*Bact            + input

    return(list(c(dBact,dSub)))
  })
}

## root is the condition where sum of |rates of change|
## is very small

rootfun <- function (t, state, pars) {
  dstate <- unlist(model(t, state, pars)) # rate of change vector
  return(sum(abs(dstate)) - 1e-10)
}

pars <- list(Bini = 0.1, Sini = 100, gmax = 0.5, eff = 0.5,
             ks = 0.5, rB = 0.01, dB = 0.01, input = 0.1)

tout    <- c(0, 1e10)
state   <- c(Bact = pars$Bini, Sub = pars$Sini)
out     <- lsodar(state, tout, model, pars, rootfun = rootfun)
print(out)


## =======================================================================
## Example 3:
##   using lsodar to trigger an event
## =======================================================================

## a state variable is decaying at a first-order rate. 
## when it reaches the value 0.1, a random amount is added.

derivfun <- function (t,y,parms)
  list (-0.05 * y)

rootfun <- function (t,y,parms)
  return(y - 0.1) 

eventfun <- function(t,y,parms)
  return(y + runif(1))  

yini <- 0.8
times <- 0:200

out <- lsodar(func=derivfun, y = yini, times=times, 
  rootfunc = rootfun, events = list(func=eventfun, root = TRUE))

plot(out, type = "l", lwd = 2, main = "lsodar with event")
  



