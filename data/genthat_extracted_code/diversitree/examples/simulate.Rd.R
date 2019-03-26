library(diversitree)


### Name: simulate
### Title: Evolve Birth-Death Trees
### Aliases: trees tree.bd tree.bisse tree.bisseness tree.classe
###   tree.geosse tree.musse tree.musse.multitrait tree.quasse tree.yule
###   prune
### Keywords: models

### ** Examples

pars <- c(0.1, 0.2, 0.03, 0.03, 0.01, 0.01)
set.seed(3)
phy <- tree.bisse(pars, max.taxa=30, x0=0)
phy$tip.state

h <- history.from.sim.discrete(phy, 0:1)
plot(h, phy)

## Retain extinct species:
set.seed(3)
phy2 <- tree.bisse(pars, max.taxa=30, x0=0, include.extinct=TRUE)
h2 <- history.from.sim.discrete(phy2, 0:1)
plot(h2, phy2)

#### MuSSE:
## Two states
pars <- c(.1, .2, .03, .04, 0.05, 0.1)
set.seed(2)
phy <- tree.musse(pars, 20, x0=1)

h <- history.from.sim.discrete(phy, 1:2)
plot(h, phy)

## A 3-state example where movement is only allowed between neighbouring
## states (1 <-> 2 <-> 3), and where speciation and extinction rates
## increase moving from 1 -> 2 -> 3:
pars <- c(.1,  .15,  .2,  # lambda 1, 2, 3
          .03, .045, .06, # mu 1, 2, 3
          .05, 0,         # q12, q13
          .05, .05,       # q21, q23
          0,   .05)       # q31, q32

set.seed(2)
phy <- tree.musse(pars, 30, x0=1, include.extinct=TRUE)

h <- history.from.sim.discrete(phy, 1:3)
plot(h, phy, cex=.7)

## And with extinct taxa pruned:
phy2 <- prune(phy)
h2 <- history.from.sim.discrete(phy2, 1:3)
plot(h2, phy2, cex=.7)

## This can all be done in one step (and is by default):
set.seed(2)
phy <- tree.musse(pars, 30, x0=1)
h <- history.from.sim.discrete(phy, 1:3)
plot(h, phy, cex=.7)



