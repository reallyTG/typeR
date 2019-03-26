library(lfstat)


### Name: reversing
### Title: Reversed functions for several Extreme Value Distributions
### Aliases: reversing cdf_ev pel_ev qua_ev
### Keywords: low-flow fitting

### ** Examples

data("ngaruroro")
ng <- as.xts(ngaruroro)
minima <- as.vector(apply.yearly(ng$discharge, min, na.rm = TRUE))

# Weibull distribution and reversed GEV give the same results
distr <- "wei"
qua_ev(distr, seq(0, 1, 0.1), para = pel_ev(distr, samlmu(minima)))

distr <- "gevR"
qua_ev(distr, seq(0, 1, 0.1), para = pel_ev(distr, samlmu(minima)))



