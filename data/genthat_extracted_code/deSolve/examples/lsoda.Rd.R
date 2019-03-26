library(deSolve)


### Name: lsoda
### Title: Solver for Ordinary Differential Equations (ODE), Switching
###   Automatically Between Stiff and Non-stiff Methods
### Aliases: lsoda
### Keywords: math

### ** Examples

## =======================================================================
## Example 1:
##   A simple resource limited Lotka-Volterra-Model
##
## Note: 
## 1. parameter and state variable names made
##    accessible via "with" function
## 2. function sigimp accessible through lexical scoping
##    (see also ode and rk examples)
## =======================================================================

SPCmod <- function(t, x, parms) {
  with(as.list(c(parms, x)), {
    import <- sigimp(t)
    dS <- import - b*S*P + g*C     #substrate
    dP <- c*S*P  - d*C*P           #producer
    dC <- e*P*C  - f*C             #consumer
    res <- c(dS, dP, dC)
    list(res)
  })
}

## Parameters 
parms  <- c(b = 0.0, c = 0.1, d = 0.1, e = 0.1, f = 0.1, g = 0.0)

## vector of timesteps
times  <- seq(0, 100, length = 101)

## external signal with rectangle impulse
signal <- as.data.frame(list(times = times,
                            import = rep(0,length(times))))

signal$import[signal$times >= 10 & signal$times <= 11] <- 0.2

sigimp <- approxfun(signal$times, signal$import, rule = 2)


## Start values for steady state
y <- xstart <- c(S = 1, P = 1, C = 1)

## Solving
out <-  lsoda(xstart, times, SPCmod, parms) 

## Plotting
mf <- par("mfrow")
plot(out, main = c("substrate", "producer", "consumer"))
plot(out[,"P"], out[,"C"], type = "l", xlab = "producer", ylab = "consumer")
par(mfrow = mf)

## =======================================================================
## Example 2:
##  from lsoda source code
## =======================================================================

## names makes this easier to read, but may slow down execution.
parms   <- c(k1 = 0.04, k2 = 1e4, k3 = 3e7)
my.atol <- c(1e-6,  1e-10,  1e-6)
times   <- c(0,4 * 10^(-1:10))

lsexamp <- function(t, y, p) {
  yd1 <- -p["k1"] * y[1] + p["k2"] * y[2]*y[3]
  yd3 <- p["k3"] * y[2]^2
  list(c(yd1, -yd1-yd3, yd3), c(massbalance = sum(y)))
}

exampjac <- function(t, y, p) {
  matrix(c(-p["k1"],	   p["k1"],       0,

            p["k2"]*y[3],
          - p["k2"]*y[3] - 2*p["k3"]*y[2],
                           2*p["k3"]*y[2],

          p["k2"]*y[2],  -p["k2"]*y[2],  0
          ), 3, 3)
}
  

## measure speed (here and below)
system.time( 
  out <- lsoda(c(1, 0, 0), times, lsexamp, parms, rtol = 1e-4,
           atol = my.atol, hmax = Inf)
)  
out

## This is what the authors of lsoda got for the example:

## the output of this program (on a cdc-7600 in single precision)
## is as follows..
##
## at t =  4.0000e-01   y =  9.851712e-01  3.386380e-05  1.479493e-02
## at t =  4.0000e+00   y =  9.055333e-01  2.240655e-05  9.444430e-02
## at t =  4.0000e+01   y =  7.158403e-01  9.186334e-06  2.841505e-01
## at t =  4.0000e+02   y =  4.505250e-01  3.222964e-06  5.494717e-01
## at t =  4.0000e+03   y =  1.831975e-01  8.941774e-07  8.168016e-01
## at t =  4.0000e+04   y =  3.898730e-02  1.621940e-07  9.610125e-01
## at t =  4.0000e+05   y =  4.936363e-03  1.984221e-08  9.950636e-01
## at t =  4.0000e+06   y =  5.161831e-04  2.065786e-09  9.994838e-01
## at t =  4.0000e+07   y =  5.179817e-05  2.072032e-10  9.999482e-01
## at t =  4.0000e+08   y =  5.283401e-06  2.113371e-11  9.999947e-01
## at t =  4.0000e+09   y =  4.659031e-07  1.863613e-12  9.999995e-01
## at t =  4.0000e+10   y =  1.404280e-08  5.617126e-14  1.000000e+00

## Using the analytic Jacobian speeds up execution a little :

system.time( 
  outJ <- lsoda(c(1, 0, 0), times, lsexamp, parms, rtol = 1e-4,
            atol = my.atol, jacfunc = exampjac, jactype = "fullusr", hmax = Inf)
)
  
all.equal(as.data.frame(out), as.data.frame(outJ)) # TRUE
diagnostics(out)
diagnostics(outJ) # shows what lsoda did internally




