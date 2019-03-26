library(deSolve)


### Name: DLLres
### Title: Evaluates a Residual Derivative Function Represented in a DLL
### Aliases: DLLres
### Keywords: utilities

### ** Examples

## =========================================================================
## Residuals from the daspk chemical model, production a forcing function
## =========================================================================
## Parameter values and initial conditions
## see example(daspk) for a more comprehensive implementation

pars <- c(K = 1, ka = 1e6, r = 1)

## Initial conc; D is in equilibrium with A,B
y <- c(A = 2, B = 3, D = 2 * 3/pars["K"])

## Initial rate of change
dy <- c(dA = 0, dB = 0, dD = 0)

## production increases with time
prod <- matrix(ncol = 2,
          data = c(seq(0, 100, by = 10), seq(0.1, 0.5, len = 11)))

DLLres(y = y, dy = dy, times = 5, res = "chemres",
          dllname = "deSolve", initfunc = "initparms",
          initforc = "initforcs", parms = pars, forcings = prod,
          nout = 2, outnames = c("CONC", "Prod"))




