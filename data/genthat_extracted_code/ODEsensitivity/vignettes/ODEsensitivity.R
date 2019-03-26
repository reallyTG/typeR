## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE
  , comment = "#>"
  , fig.width = 7
)
library(ODEsensitivity)

## ------------------------------------------------------------------------
LVmod = function(Time, State, Pars) {
  with(as.list(c(State, Pars)), {
    Ingestion <- rIng * Prey * Predator
    GrowthPrey <- rGrow * Prey * (1 - Prey/K)
    MortPredator <- rMort * Predator
    dPrey <- GrowthPrey - Ingestion
    dPredator <- Ingestion * assEff - MortPredator
    return(list(c(dPrey, dPredator)))
  })
}

## ------------------------------------------------------------------------
LVpars = c("rIng", "rGrow", "rMort", "assEff", "K")
LVbinf = c(0.05, 0.05, 0.05, 0.05, 1)
LVbsup = c(1.00, 3.00, 0.95, 0.95, 20)
LVinit = c(Prey = 1, Predator = 2)
LVtimes = c(0.01, seq(1, 50, by = 1))

## ------------------------------------------------------------------------
set.seed(1618)
LVres_morris = ODEmorris(mod = LVmod, pars = LVpars, state_init = LVinit
                         , times = LVtimes, binf = LVbinf, bsup = LVbsup
                         )

## ------------------------------------------------------------------------
str(LVres_morris, give.attr = FALSE)

## ------------------------------------------------------------------------
plot(LVres_morris)

## ------------------------------------------------------------------------
plot(LVres_morris, pars_plot = c("rIng", "rMort", "assEff"), state_plot = "Predator")

