## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)
library(FossilSim)

## ------------------------------------------------------------------------
t = ape::rtree(6)
f = sim.fossils.poisson(rate = 2, tree = t)

SAt = SAtree.from.fossils(tree = t, fossils = f)
print(SAt)
print(SAt$complete)

## ------------------------------------------------------------------------
SAt_pruned = prune.fossils(tree = SAt)
plot(SAt_pruned)

## ------------------------------------------------------------------------
SAt_sampled = sampled.tree.from.combined(tree = SAt)
plot(SAt_sampled)

