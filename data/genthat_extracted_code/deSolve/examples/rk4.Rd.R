library(deSolve)


### Name: rk4
### Title: Solve System of ODE (Ordinary Differential Equation)s by Euler's
###   Method or Classical Runge-Kutta 4th Order Integration.
### Aliases: rk4 euler euler.1D
### Keywords: math

### ** Examples

## =======================================================================
## Example: Analytical and numerical solutions of logistic growth
## =======================================================================

## the derivative of the logistic
logist <- function(t, x, parms) {
  with(as.list(parms), {
    dx <- r * x[1] * (1 - x[1]/K)
    list(dx)
  })
}

time  <- 0:100
N0    <- 0.1; r <- 0.5; K <- 100
parms <- c(r = r, K = K)
x <- c(N = N0)

## analytical solution
plot(time, K/(1 + (K/N0-1) * exp(-r*time)), ylim = c(0, 120),
  type = "l", col = "red", lwd = 2)

## reasonable numerical solution with rk4
time <- seq(0, 100, 2)
out <- as.data.frame(rk4(x, time, logist, parms))
points(out$time, out$N, pch = 16, col = "blue", cex = 0.5)

## same time step with euler, systematic under-estimation
time <- seq(0, 100, 2)
out <- as.data.frame(euler(x, time, logist, parms))
points(out$time, out$N, pch = 1)

## unstable result
time <- seq(0, 100, 4)
out <- as.data.frame(euler(x, time, logist, parms))
points(out$time, out$N, pch = 8, cex = 0.5)

## method with automatic time step
out <- as.data.frame(lsoda(x, time, logist, parms))
points(out$time, out$N, pch = 1, col = "green")

legend("bottomright",
  c("analytical","rk4, h=2", "euler, h=2",
    "euler, h=4", "lsoda"),
  lty = c(1, NA, NA, NA, NA), lwd = c(2, 1, 1, 1, 1),
  pch = c(NA, 16, 1, 8, 1),
  col = c("red", "blue", "black", "black", "green"))



