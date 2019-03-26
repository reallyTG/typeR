## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)
library(FossilSim)

## ------------------------------------------------------------------------
trees <- sim.fbd.taxa(n = 10, numbsim = 10, lambda = 3, mu = 2, psi = 2)

plot(trees[[1]])

## ------------------------------------------------------------------------
rangeplot.asymmetric(trees[[1]])

## ------------------------------------------------------------------------
trees <- sim.fbd.taxa(n = 10, numbsim = 10, lambda = 3, mu = 2, psi = 2, complete = T)

print(trees[[1]]$complete)

rangeplot.asymmetric(trees[[1]])

## ------------------------------------------------------------------------
trees = sim.fbd.rateshift.taxa(n = 10, numbsim = 1, lambda = c(2,1), mu = c(0,0.3), psi = c(1,0.1), times = c(0.3))

rangeplot.asymmetric(trees[[1]])

