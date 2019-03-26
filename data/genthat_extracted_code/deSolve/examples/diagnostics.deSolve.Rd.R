library(deSolve)


### Name: diagnostics.deSolve
### Title: Print Diagnostic Characteristics of ODE and DAE Solvers
### Aliases: diagnostics.deSolve
### Keywords: utilities

### ** Examples

## The famous Lorenz equations: chaos in the earth's atmosphere
## Lorenz 1963. J. Atmos. Sci. 20, 130-141.

chaos <- function(t, state, parameters) {
  with(as.list(c(state)), {

    dx     <- -8/3 * x + y * z
    dy     <- -10 * (y - z)
    dz     <- -x * y + 28 * y - z

    list(c(dx, dy, dz))
  })
}

state <- c(x = 1, y = 1, z = 1)
times <- seq(0, 50, 0.01)
out   <- vode(state, times, chaos, 0)
pairs(out, pch = ".")
diagnostics(out)



