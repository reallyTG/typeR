library(deSolve)


### Name: vode
### Title: Solver for Ordinary Differential Equations (ODE)
### Aliases: vode
### Keywords: math

### ** Examples

## =======================================================================
## ex. 1
## The famous Lorenz equations: chaos in the earth's atmosphere
## Lorenz 1963. J. Atmos. Sci. 20, 130-141.
## =======================================================================

chaos <- function(t, state, parameters) {
  with(as.list(c(state)), {

    dx     <- -8/3 * x + y * z
    dy     <- -10 * (y - z)
    dz     <- -x * y + 28 * y - z

    list(c(dx, dy, dz))
  })
}

state <- c(x = 1, y = 1, z = 1)
times <- seq(0, 100, 0.01)

out   <- vode(state, times, chaos, 0)

plot(out, type = "l")   # all versus time
plot(out[,"x"], out[,"y"], type = "l", main = "Lorenz butterfly",
  xlab = "x", ylab = "y")


## =======================================================================
## ex. 2
## SCOC model, in FORTRAN  - to see the FORTRAN code:
## browseURL(paste(system.file(package="deSolve"),
##                             "/doc/examples/dynload/scoc.f",sep=""))
## example from Soetaert and Herman, 2009, chapter 3. (simplified)
## =======================================================================

## Forcing function data
Flux <- matrix(ncol = 2, byrow = TRUE, data = c(
  1,  0.654, 11, 0.167,  21, 0.060, 41, 0.070, 73, 0.277, 83, 0.186,
  93, 0.140,103, 0.255, 113, 0.231,123, 0.309,133, 1.127,143, 1.923,
  153,1.091,163, 1.001, 173, 1.691,183, 1.404,194, 1.226,204, 0.767,
  214,0.893,224, 0.737, 234, 0.772,244, 0.726,254, 0.624,264, 0.439,
  274,0.168,284, 0.280, 294, 0.202,304, 0.193,315, 0.286,325, 0.599,
  335,1.889,345, 0.996, 355, 0.681,365, 1.135))

parms <- c(k = 0.01)

meanDepo <- mean(approx(Flux[,1], Flux[,2], xout = seq(1, 365, by = 1))$y)

Yini <- c(y = as.double(meanDepo/parms))

times <- 1:365
out <- vode(Yini, times, func = "scocder",
    parms = parms, dllname = "deSolve",
    initforc = "scocforc", forcings = Flux,
    initfunc = "scocpar", nout = 2,
    outnames = c("Mineralisation", "Depo"))

matplot(out[,1], out[,c("Depo", "Mineralisation")], 
        type = "l", col = c("red", "blue"), xlab = "time", ylab = "Depo")

## Constant interpolation of forcing function - left side of interval
fcontrol <- list(method = "constant")

out2 <- vode(Yini, times, func = "scocder",
    parms = parms, dllname = "deSolve",
    initforc = "scocforc",  forcings = Flux, fcontrol = fcontrol,
    initfunc = "scocpar", nout = 2,
    outnames = c("Mineralisation", "Depo"))
matplot(out2[,1], out2[,c("Depo", "Mineralisation")], 
        type = "l", col = c("red", "blue"), xlab = "time", ylab = "Depo")

## Constant interpolation of forcing function - middle of interval
fcontrol <- list(method = "constant", f = 0.5)

out3 <- vode(Yini, times, func = "scocder",
    parms = parms, dllname = "deSolve",
    initforc = "scocforc",  forcings = Flux, fcontrol = fcontrol,
    initfunc = "scocpar", nout = 2,
    outnames = c("Mineralisation", "Depo"))

matplot(out3[,1], out3[,c("Depo", "Mineralisation")], 
        type = "l", col = c("red", "blue"), xlab = "time", ylab = "Depo")

plot(out, out2, out3)



