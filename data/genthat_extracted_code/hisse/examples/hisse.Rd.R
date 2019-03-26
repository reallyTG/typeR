library(hisse)


### Name: hisse
### Title: Hidden State Speciation and Extinction
### Aliases: hisse
### Keywords: models

### ** Examples

## No test: 
library(diversitree)
pars <- c(0.1, 0.2, 0.03, 0.03, 0.01, 0.01)
set.seed(4) 
phy <- tree.bisse(pars, max.t=30, x0=0)
sim.dat <- data.frame(names(phy$tip.state), phy$tip.state)
## Fit BiSSE equivalent:
trans.rates.bisse <- TransMatMaker(hidden.states=FALSE)
pp.bisse <- hisse(phy, sim.dat, hidden.states=FALSE, turnover.anc=c(1,2,0,0), 
eps.anc=c(1,2,0,0), trans.rate=trans.rates.bisse)

## Now fit HiSSE equivalent with a hidden state for state 1:
trans.rates.hisse <- TransMatMaker(hidden.states=TRUE)
trans.rates.hisse <- ParDrop(trans.rates.hisse, c(2,3,5,7,8,9,10,12))
pp.hisse <- hisse(phy, sim.dat, hidden.states=TRUE, turnover.anc=c(1,2,0,3), 
eps.anc=c(1,2,0,3), trans.rate=trans.rates.hisse)
## End(No test)



