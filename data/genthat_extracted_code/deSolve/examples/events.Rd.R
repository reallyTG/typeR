library(deSolve)


### Name: events
### Title: Implementing Events and Roots in Differential Equation Models.
### Aliases: events roots
### Keywords: utilities

### ** Examples

## =============================================================================
## 1. EVENTS in a data.frame
## =============================================================================

## derivative function: derivatives set to 0
derivs <- function(t, var, parms) {
  list(dvar = rep(0, 2))
}

yini <- c(v1 = 1, v2 = 2)
times <- seq(0, 10, by = 0.1)

eventdat <- data.frame(var = c("v1", "v2", "v2", "v1"),
                       time = c(1, 1, 5, 9) ,
                       value = c(1, 2, 3, 4),
                       method = c("add", "mult", "rep", "add"))
eventdat

out <- vode(func = derivs, y = yini, times = times, parms = NULL,
            events = list(data = eventdat))
plot(out)

##
eventdat <- data.frame(var = c(rep("v1", 10), rep("v2", 10)),
                       time = c(1:10, 1:10),
                       value = runif(20),
                       method = rep("add", 20))
eventdat

out <- ode(func = derivs, y = yini, times = times, parms = NULL,
           events = list(data = eventdat))

plot(out)

## =============================================================================
## 2. EVENTS in a function
## =============================================================================

## derivative function: rate of change v1 = 0, v2 reduced at first-order rate
derivs <- function(t, var, parms) {
   list(c(0, -0.5 * var[2]))
}


# events: add 1 to v1, multiply v2 with random number
eventfun <- function(t, y, parms){
  with (as.list(y),{
    v1 <- v1 + 1
    v2 <- 5 * runif(1)
    return(c(v1, v2))
  })
}

yini <- c(v1 = 1, v2 = 2)
times <- seq(0, 10, by = 0.1)

out <- ode(func = derivs, y = yini, times = times, parms = NULL,
           events = list(func = eventfun, time = c(1:9, 2.2, 2.4)) )
plot(out, type = "l")

## =============================================================================
## 3. EVENTS triggered by a root function
## =============================================================================

## derivative: simple first-order decay
derivs <- function(t, y, pars) {
  return(list(-0.1 * y))
}

## event triggered if state variable = 0.5
rootfun <- function (t, y, pars) {
  return(y - 0.5)
}

## sets state variable = 1
eventfun <- function(t, y, pars) {
  return(y = 1)
}

yini <- 2
times <- seq(0, 100, 0.1)

## uses ode to solve; root = TRUE specifies that the event is
## triggered by a root.
out <- ode(times = times, y = yini, func = derivs, parms = NULL,
           events = list(func = eventfun, root = TRUE),
           rootfun = rootfun)

plot(out, type = "l")

## time of the root:
troot <- attributes(out)$troot
points(troot, rep(0.5, length(troot)))


## =============================================================================
## 4. More ROOT examples: Rotation function
## =============================================================================
Rotate <- function(t, x, p )
  list(c( x[2],
         -x[1]  ))

## Root = when second state variable = 0
rootfun <- function(t, x, p) x[2]

## "event" returns state variables unchanged
eventfun <- function(t, x, p) x
times <- seq(from = 0, to = 15, by = 0.1)

## 1. No event: stops at first root
out1 <- ode(func = Rotate, y = c(5, 5), parms = 0,
           times = times, rootfun = rootfun)
tail(out1)

## 2. Continues till end of times and records the roots
out <- ode(func = Rotate, y = c(5, 5), parms = 0,
           times = times, rootfun = rootfun,
           events = list(func = eventfun, root = TRUE) )

plot(out)
troot <- attributes(out)$troot  # time of roots
points(troot,rep(0, length (troot)))

## Multiple roots:  either one of the state variables = 0
root2 <- function(t, x, p) x

out2 <- ode(func = Rotate, y = c(5, 5), parms = 0,
           times = times, rootfun = root2,
           events = list(func = eventfun, root = TRUE) )

plot(out2, which = 2)
troot <- attributes(out2)$troot
indroot <- attributes(out2)$indroot  # which root was found
points(troot, rep(0, length (troot)), col = indroot, pch = 18, cex = 2)

## Multiple roots and stop at first time root 1.
out3 <- ode(func = Rotate, y = c(5, 5), parms = 0,
      times = times, rootfun = root2,
      events = list(func = eventfun, root = TRUE, terminalroot = 1))


## =============================================================================
## 5. Stop at 5th root - only works with radau.
## =============================================================================
Rotate <- function(t, x, p )
  list(c( x[2],
         -x[1],
         0  ))

## Root = when second state variable = 0
root3  <- function(t, x, p)  c(x[2], x[3] - 5)
event3 <- function (t, x, p) c(x[1:2], x[3]+1)
times <- seq(0, 15, 0.1)
out3 <- ode(func = Rotate, y = c(x1 = 5, x2 = 5, nroot = 0),
      parms = 0, method = "radau",
      times = times, rootfun = root3,
      events = list(func = event3, root = TRUE, terminalroot = 2))
plot(out3)
attributes(out3)[c("troot", "nroot", "indroot")]

## =============================================================================
## 6 Event in R-code, model function in compiled code - based on vode example
## =============================================================================

times <- 1:365
Flux <- cbind(times, sin(pi*times/365)^2) # forcing function

# run without events
out <- ode(y = c(C = 1), times, func = "scocder", parms = c(k=0.01),
   dllname = "deSolve", initforc = "scocforc", forcings = Flux,
   initfunc = "scocpar", nout = 2, outnames = c("Mineralisation", "Depo"))

# Event halves the concentration
EventMin <- function(t, y , p) y/2

out2 <- ode(y = c(C = 1), times, func = "scocder", parms = c(k=0.01),
   dllname = "deSolve", initforc = "scocforc", forcings = Flux,
   initfunc = "scocpar", nout = 2, outnames = c("Mineralisation", "Depo"),
   events = list (func = EventMin, time = c(50.1, 200, 210.5)))

plot(out, out2)





