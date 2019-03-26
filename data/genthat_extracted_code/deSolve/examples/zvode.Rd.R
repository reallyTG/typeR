library(deSolve)


### Name: zvode
### Title: Solver for Ordinary Differential Equations (ODE) for COMPLEX
###   variables
### Aliases: zvode
### Keywords: math

### ** Examples


## =======================================================================
## Example 1 - very simple example 
## df/dt = 1i*f, where 1i is the imaginary unit
## The initial value is f(0) = 1 = 1+0i
## =======================================================================

ZODE <- function(Time, f, Pars) {
  df <-  1i*f
  return(list(df))
}

pars    <- NULL
yini    <- c(f = 1+0i)
times   <- seq(0, 2*pi, length = 100)
out     <- zvode(func = ZODE, y = yini, parms = pars, times = times,
  atol = 1e-10, rtol = 1e-10)

# The analytical solution to this ODE is the exp-function:
# f(t) = exp(1i*t)
#      = cos(t)+1i*sin(t)  (due to Euler's equation)

analytical.solution  <- exp(1i * times) 

## compare numerical and analytical solution
tail(cbind(out[,2], analytical.solution))


## =======================================================================
## Example 2 - example in "zvode.f",  
## df/dt = 1i*f        (same as above ODE)
## dg/dt = -1i*g*g*f   (an additional ODE depending on f)
##
## Initial values are
## g(0) = 1/2.1 and
## z(0) = 1  
## =======================================================================

ZODE2<-function(Time,State,Pars) {
  with(as.list(State), {
    df <- 1i * f
    dg <- -1i * g*g * f
    return(list(c(df, dg)))
  })
}

yini    <- c(f = 1 + 0i, g = 1/2.1 + 0i)
times   <- seq(0, 2*pi, length = 100)
out     <- zvode(func = ZODE2, y = yini, parms = NULL, times = times,
  atol = 1e-10, rtol = 1e-10)


## The analytical solution is
## f(t) = exp(1i*t)   (same as above)
## g(t) = 1/(f(t) + 1.1)

analytical <- cbind(f = exp(1i * times), g = 1/(exp(1i * times) + 1.1))

## compare numerical solution and the two analytical ones:
tail(cbind(out[,2], analytical[,1]))




