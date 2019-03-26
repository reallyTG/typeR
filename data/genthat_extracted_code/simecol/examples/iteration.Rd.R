library(simecol)


### Name: iteration
### Title: Discrete Simulation
### Aliases: iteration iteration-methods iteration,numeric-method
###   iteration,simObj-method iteration,gridModel-method
###   iteration,odeModel-method
### Keywords: misc

### ** Examples

data(conway)

## No test: 
## plot after simulation:
plot(sim(conway), delay=100)

## plot during simulation
sim(conway, animate=TRUE, delay=100)
## End(No test)

## discrete version of logistic growth equation
## Note: function main returns the *new value*, not the derivative

dlogist <- new("odeModel",
  main = function (time, init, parms, ...) {
    x <- init
    with(as.list(parms), {
      x <- x + r * x * (1 - x / K) * DELTAT
      #   ^^^ add to old value       ^^^^^^ special parameter with time step
      list(c(x))
    })
  },
  parms  = c(r=0.1, K=10),
  times  = seq(0, 100, 1),
  init   = c(population=0.1),
  solver = "iteration" #!!!
)

plot(sim(dlogist))

## alternative with function that returns the derivative
## discrete steps are realized with the euler method

dlogist <- new("odeModel",
  main = function (time, init, parms, ...) {
    x <- init
    with(as.list(parms), {
      x <- r * x * (1 - x / K)
      list(c(x))
    })
  },
  parms  = c(r=0.1, K=10),
  times  = seq(0, 100, 1),
  init   = c(population=0.1),
  solver = "euler"
)

plot(sim(dlogist))

## second alternative: use of the "iteration" solver from
## package deSolve, that supports extended plotting functions

dlogist <- new("odeModel",
  main = function (time, init, parms, ...) {
    x <- init[1]
    with(as.list(parms), {
      x <- x + r * x * (1 - x / K)
      #   ^^^ add to old value
      list(c(x))
    })
  },
  parms  = c(r=0.1, K=10),
  times  = seq(0, 100, 1),
  init   = c(population=0.1),
  solver =  function(y, times, func, parms, ...)
              ode(y, times, func, parms, ..., method="iteration")
)

plot(sim(dlogist))





