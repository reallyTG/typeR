library(rootSolve)


### Name: steady
### Title: General steady-state solver for a set of ordinary differential
###   equations.
### Aliases: steady
### Keywords: math

### ** Examples

## =======================================================================
##  Bacteria (Bac) growing on a substrate (Sub)
## =======================================================================
  
model <- function(t, state, pars) {
  with (as.list(c(state,pars)), {
  #       substrate uptake             death  respiration
  dBact = gmax*eff*Sub/(Sub+ks)*Bact - dB*Bact - rB*Bact
  dSub  =-gmax    *Sub/(Sub+ks)*Bact + dB*Bact          +input
  
  return(list(c(dBact, dSub)))
                                })
}
  
pars <- list(gmax = 0.5,eff = 0.5,
             ks = 0.5, rB = 0.01, dB = 0.01, input = 0.1)
  # Newton-Raphson
steady(y = c(Bact = 0.1, Sub = 0), time = 0,
       func = model, parms = pars, pos = TRUE)  

  # Dynamic run to steady-state
as.data.frame(steady(y = c(Bact = 0.1, Sub = 0), time = c(0, 1e5),
                     func = model, parms = pars, method = "runsteady"))




