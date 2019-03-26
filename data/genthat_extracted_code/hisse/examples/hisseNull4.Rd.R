library(hisse)


### Name: hisse.null4
### Title: Four state trait-independent Hidden State Speciation and
###   Extinction
### Aliases: hisse.null4
### Keywords: models

### ** Examples

## No test: 
## Not run
library(diversitree)
pars <- c(0.1, 0.2, 0.03, 0.03, 0.01, 0.01)
set.seed(4) 
phy <- tree.bisse(pars, max.t=30, x0=0)
sim.dat <- data.frame(names(phy$tip.state), phy$tip.state)

## Fit null-four HiSSE:
pp.hisse.null <- hisse.null4(phy, sim.dat, turnover.anc=rep(c(1,2,3,4),2), 
eps.anc=rep(c(1,2,3,4),2), trans.type="equal")

## Fit null-two HiSSE model:
trans.rates.hisse <- TransMatMaker(hidden.states=TRUE)
trans.rates.hisse <- ParDrop(trans.rates.hisse, c(3,5,8,10))
trans.rates.hisse[!is.na(trans.rates.hisse) & !trans.rates.hisse == 0] = 1
pp.hisse <- hisse(phy, sim.dat, hidden.states=TRUE, turnover.anc=c(1,1,2,2), 
eps.anc=c(1,1,2,2), trans.rate=trans.rates.hisse)
## End(No test)



