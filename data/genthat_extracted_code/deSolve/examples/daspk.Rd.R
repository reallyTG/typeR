library(deSolve)


### Name: daspk
### Title: Solver for Differential Algebraic Equations (DAE)
### Aliases: daspk
### Keywords: math

### ** Examples

## =======================================================================
## Coupled chemical reactions including an equilibrium
## modeled as (1) an ODE and (2) as a DAE
##
## The model describes three chemical species A,B,D:
## subjected to equilibrium reaction D <- > A + B
## D is produced at a constant rate, prod
## B is consumed at 1s-t order rate, r
## Chemical problem formulation 1: ODE
## =======================================================================

## Dissociation constant
K <- 1 

## parameters
pars <- c(
        ka   = 1e6,     # forward rate
        r    = 1,
        prod = 0.1)


Fun_ODE <- function (t, y, pars)
{
  with (as.list(c(y, pars)), {
    ra  <- ka*D        # forward rate
    rb  <- ka/K *A*B   # backward rate

    ## rates of changes
    dD  <- -ra + rb + prod
    dA  <-  ra - rb
    dB  <-  ra - rb - r*B
    return(list(dy = c(dA, dB, dD),
                CONC = A+B+D))
  })
}

## =======================================================================
## Chemical problem formulation 2: DAE
## 1. get rid of the fast reactions ra and rb by taking
## linear combinations   : dD+dA = prod (res1) and
##                         dB-dA = -r*B (res2)
## 2. In addition, the equilibrium condition (eq) reads:
## as ra = rb : ka*D = ka/K*A*B = >      K*D = A*B
## =======================================================================

Res_DAE <- function (t, y, yprime, pars)
{
  with (as.list(c(y, yprime, pars)), {

    ## residuals of lumped rates of changes
    res1 <- -dD - dA + prod
    res2 <- -dB + dA - r*B
    
    ## and the equilibrium equation
    eq   <- K*D - A*B

    return(list(c(res1, res2, eq),
                CONC = A+B+D))
  })
}

## =======================================================================
## Chemical problem formulation 3: Mass * Func
## Based on the DAE formulation
## =======================================================================

Mass_FUN <- function (t, y, pars) {
  with (as.list(c(y, pars)), {

    ## as above, but without the 
    f1 <- prod
    f2 <- - r*B
    
    ## and the equilibrium equation
    f3   <- K*D - A*B

    return(list(c(f1, f2, f3),
                CONC = A+B+D))
  })
}
Mass <- matrix(nrow = 3, ncol = 3, byrow = TRUE, 
  data=c(1,  0, 1,         # dA + 0 + dB
        -1,  1, 0,         # -dA + dB +0
         0,  0, 0))        # algebraic
         
times <- seq(0, 100, by = 2)

## Initial conc; D is in equilibrium with A,B
y     <- c(A = 2, B = 3, D = 2*3/K)

## ODE model solved with daspk
ODE <- daspk(y = y, times = times, func = Fun_ODE,
                     parms = pars, atol = 1e-10, rtol = 1e-10)

## Initial rate of change
dy  <- c(dA = 0, dB = 0, dD = 0) 

## DAE model solved with daspk
DAE <- daspk(y = y, dy = dy, times = times,
         res = Res_DAE, parms = pars, atol = 1e-10, rtol = 1e-10)

MASS<- daspk(y=y, times=times, func = Mass_FUN, parms = pars, mass = Mass)

## ================
## plotting output
## ================

plot(ODE, DAE, xlab = "time", ylab = "conc", type = c("l", "p"),
     pch = c(NA, 1))

legend("bottomright", lty = c(1, NA), pch = c(NA, 1),
  col = c("black", "red"), legend = c("ODE", "DAE"))

# difference between both implementations:
max(abs(ODE-DAE))

## =======================================================================
## same DAE model, now with the Jacobian
## =======================================================================
jacres_DAE <- function (t, y, yprime, pars, cj)
{
    with (as.list(c(y, yprime, pars)), {
##    res1 = -dD - dA + prod
      PD[1,1] <- -1*cj      # d(res1)/d(A)-cj*d(res1)/d(dA)
      PD[1,2] <- 0          # d(res1)/d(B)-cj*d(res1)/d(dB)
      PD[1,3] <- -1*cj      # d(res1)/d(D)-cj*d(res1)/d(dD)
##     res2 = -dB + dA - r*B
      PD[2,1] <- 1*cj
      PD[2,2] <- -r -1*cj
      PD[2,3] <- 0
##    eq = K*D - A*B
      PD[3,1] <- -B
      PD[3,2] <- -A
      PD[3,3] <- K
      return(PD)
   })
}

PD <- matrix(ncol = 3, nrow = 3, 0)

DAE2 <- daspk(y = y, dy = dy, times = times,
          res = Res_DAE, jacres = jacres_DAE, jactype = "fullusr",
          parms = pars, atol = 1e-10, rtol = 1e-10)
         
max(abs(DAE-DAE2))

## See \dynload subdirectory for a FORTRAN implementation of this model

## =======================================================================
## The chemical model as a DLL, with production a forcing function
## =======================================================================
times <- seq(0, 100, by = 2)

pars <- c(K = 1, ka   = 1e6, r    = 1)

## Initial conc; D is in equilibrium with A,B
y     <- c(A = 2, B = 3, D = as.double(2*3/pars["K"]))

## Initial rate of change
dy  <- c(dA = 0, dB = 0, dD = 0)

# production increases with time
prod <- matrix(ncol = 2, 
               data = c(seq(0, 100, by = 10), 0.1*(1+runif(11)*1)))

ODE_dll <- daspk(y = y, dy = dy, times = times, res = "chemres",
          dllname = "deSolve", initfunc = "initparms",
          initforc = "initforcs", parms = pars, forcings = prod,
          atol = 1e-10, rtol = 1e-10, nout = 2, 
          outnames = c("CONC","Prod"))

plot(ODE_dll, which = c("Prod", "D"), xlab = "time",
     ylab = c("/day", "conc"), main = c("production rate","D"))




