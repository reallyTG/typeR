library(FME)


### Name: modCRL
### Title: Monte Carlo Analysis
### Aliases: modCRL summary.modCRL plot.modCRL pairs.modCRL hist.modCRL
### Keywords: utilities

### ** Examples


## =======================================================================
## Bacterial growth model as in Soetaert and Herman, 2009
## =======================================================================

pars <- list(gmax = 0.5,eff = 0.5,
              ks = 0.5, rB = 0.01, dB = 0.01)

solveBact <- function(pars) {
  derivs <- function(t,state,pars) {    # returns rate of change
    with (as.list(c(state,pars)), {
      dBact <-  gmax*eff * Sub/(Sub + ks)*Bact - dB*Bact - rB*Bact
      dSub  <- -gmax     * Sub/(Sub + ks)*Bact + dB*Bact
      return(list(c(dBact, dSub)))
    })
  }

 state <- c(Bact = 0.1, Sub = 100)
 tout  <- seq(0, 50, by = 0.5)
 ## ode solves the model by integration...
 return(as.data.frame(ode(y = state, times = tout, func = derivs,
                          parms = pars)))
}

out <- solveBact(pars)

plot(out$time, out$Bact, main = "Bacteria",
  xlab = "time, hour", ylab = "molC/m3", type = "l", lwd = 2)

## Function that returns the last value of the simulation
SF <- function (p) {
  pars["eff"] <- p
  out <- solveBact(pars)
  return(out[nrow(out), 2:3])
}

parRange <- matrix(nr = 1, nc = 2, c(0.2, 0.8),
  dimnames = list("eff", c("min", "max")))
parRange

CRL <- modCRL(func = SF, parRange = parRange)

plot(CRL)  # plots both variables
plot(CRL, which = c("eff", "Bact"), trace = FALSE) #selects one




