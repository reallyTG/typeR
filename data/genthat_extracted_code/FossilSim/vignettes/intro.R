## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width = 5, fig.height = 5
)

## ---- echo = FALSE, results = "hide", message = FALSE--------------------
library(FossilSim)

## ---- echo = FALSE-------------------------------------------------------
set.seed(121)

## ------------------------------------------------------------------------
# simulate a tree using ape
tips = 8
t = ape::rtree(tips)
# simulate fossils using fossilsim
rate = 2
f = sim.fossils.poisson(rate = rate, tree = t)  
# plot the output
plot(f, tree = t)

## ------------------------------------------------------------------------
# simulate taxonomy using fossilsim
beta = 0.5 # probability of symmetric speciation
lambda.a = 0.1  # rate of anagenesis
s = sim.taxonomy(tree = t, beta = beta, lambda.a = lambda.a)  
# plot the output
plot(s, tree = t, legend.position = "bottomright")

