library(deSolve)


### Name: forcings
### Title: Passing Forcing Functions to Models Written in R or Compiled
###   Code.
### Aliases: forcings
### Keywords: utilities

### ** Examples

## =============================================================================
## FORCING FUNCTION: The sediment oxygen consumption example - R-code:
## =============================================================================

## Forcing function data
Flux <- matrix(ncol=2,byrow=TRUE,data=c(
  1, 0.654, 11, 0.167,   21, 0.060, 41, 0.070, 73,0.277, 83,0.186,
  93,0.140,103, 0.255,  113, 0.231,123, 0.309,133,1.127,143,1.923,
  153,1.091,163,1.001,  173, 1.691,183, 1.404,194,1.226,204,0.767,
  214, 0.893,224,0.737, 234,0.772,244, 0.726,254,0.624,264,0.439,
  274,0.168,284 ,0.280, 294,0.202,304, 0.193,315,0.286,325,0.599,
  335, 1.889,345, 0.996,355,0.681,365,1.135))

parms <- c(k=0.01)

times <- 1:365

## the model
sediment <- function( t, O2, k) 
  list (c(Depo(t) - k * O2), depo = Depo(t))

# the forcing functions; rule = 2 avoids NaNs in interpolation
Depo <- approxfun(x = Flux[,1], y = Flux[,2], method = "linear", rule = 2)

Out <- ode(times = times, func = sediment, y = c(O2 = 63), parms = parms)
  
## same forcing functions, now constant interpolation
Depo <- approxfun(x = Flux[,1], y = Flux[,2], method = "constant",
  f = 0.5, rule = 2)

Out2 <- ode(times = times, func = sediment, y = c(O2 = 63), parms = parms)

mf <- par(mfrow = c(2, 1))
plot (Out, which = "depo", type = "l", lwd = 2, mfrow = NULL)
lines(Out2[,"time"], Out2[,"depo"], col = "red", lwd = 2)

plot (Out, which = "O2", type = "l", lwd = 2, mfrow = NULL)
lines(Out2[,"time"], Out2[,"O2"], col = "red", lwd = 2)

## =============================================================================
## SCOC is the same model, as implemented in FORTRAN
## =============================================================================

out<- SCOC(times, parms = parms, Flux = Flux)

plot(out[,"time"], out[,"Depo"], type = "l", col = "red")
lines(out[,"time"], out[,"Mineralisation"], col = "blue")

## Constant interpolation of forcing function - left side of interval
fcontrol <- list(method = "constant")

out2 <- SCOC(times, parms = parms, Flux = Flux, fcontrol = fcontrol)

plot(out2[,"time"], out2[,"Depo"], type = "l", col = "red")
lines(out2[,"time"], out2[,"Mineralisation"], col = "blue")


## Not run: 
##D ## =============================================================================
##D ## show examples (see respective help pages for details)
##D ## =============================================================================
##D 
##D example(aquaphy)
##D 
##D ## show package vignette with tutorial about how to use compiled models
##D ## + source code of the vignette
##D ## + directory with C and FORTRAN sources
##D vignette("compiledCode")
##D edit(vignette("compiledCode"))
##D browseURL(paste(system.file(package = "deSolve"), "/doc", sep = ""))
## End(Not run)




