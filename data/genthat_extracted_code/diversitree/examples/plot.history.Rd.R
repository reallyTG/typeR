library(diversitree)


### Name: plot.history
### Title: Plot Character History
### Aliases: plot.history
### Keywords: hplot

### ** Examples

## Simulate a tree, but retain extinct species.
pars <- c(.1, .2, .03, .04, 0.05, 0.1) # BiSSE pars
set.seed(2)
phy <- tree.bisse(pars, 20, x0=0, include.extinct=TRUE)

## Create a 'history' from the information produced by the simulation
## and plot this
h <- history.from.sim.discrete(phy, 0:1)
plot(h, phy, cex=.7)

## Prune the extinct taxa.
phy2 <- prune(phy)

## The history must be recreated for this pruned tree:
h2 <- history.from.sim.discrete(phy2, 0:1)
plot(h2, phy2, cex=.7)



