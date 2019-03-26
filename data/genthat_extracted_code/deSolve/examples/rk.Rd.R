library(deSolve)


### Name: rk
### Title: Explicit One-Step Solvers for Ordinary Differential Equations
###   (ODE)
### Aliases: rk
### Keywords: math

### ** Examples

## =======================================================================
## Example: Resource-producer-consumer Lotka-Volterra model
## =======================================================================

## Notes:
## - Parameters are a list, names accessible via "with" function
## - Function sigimp passed as an argument (input) to model
##  (see also ode and lsoda examples)

SPCmod <- function(t, x, parms, input)  {
  with(as.list(c(parms, x)), {
    import <- input(t)
    dS <- import - b*S*P + g*C    # substrate
    dP <- c*S*P  - d*C*P          # producer
    dC <- e*P*C  - f*C            # consumer
    res <- c(dS, dP, dC)
    list(res)
  })
}

## The parameters 
parms <- c(b = 0.001, c = 0.1, d = 0.1, e = 0.1, f = 0.1, g = 0.0)

## vector of timesteps
times <- seq(0, 200, length = 101)

## external signal with rectangle impulse
signal <- data.frame(times = times,
                     import = rep(0, length(times)))

signal$import[signal$times >= 10 & signal$times <= 11] <- 0.2

sigimp <- approxfun(signal$times, signal$import, rule = 2)

## Start values for steady state
xstart <- c(S = 1, P = 1, C = 1)

## Euler method
out1  <- rk(xstart, times, SPCmod, parms, hini = 0.1, 
            input = sigimp, method = "euler")

## classical Runge-Kutta 4th order
out2 <- rk(xstart, times, SPCmod, parms, hini = 1, 
           input = sigimp, method = "rk4")

## Dormand-Prince method of order 5(4)
out3 <- rk(xstart, times, SPCmod, parms, hmax = 1, 
           input = sigimp, method = "rk45dp7")

mf <- par("mfrow")
## deSolve plot method for comparing scenarios
plot(out1, out2, out3, which = c("S", "P", "C"), 
     main = c ("Substrate", "Producer", "Consumer"),
     col =c("black", "red", "green"), 
     lty = c("solid", "dotted", "dotted"), lwd = c(1, 2, 1))

## user-specified plot function
plot (out1[,"P"], out1[,"C"], type = "l", xlab = "Producer", ylab = "Consumer")
lines(out2[,"P"], out2[,"C"], col = "red",   lty = "dotted", lwd = 2)
lines(out3[,"P"], out3[,"C"], col = "green", lty = "dotted")

legend("center", legend = c("euler", "rk4", "rk45dp7"),
  lty = c(1, 3, 3), lwd = c(1, 2, 1),
  col = c("black", "red", "green"))
par(mfrow = mf)



