library(hisse)


### Name: makeHiSSELikelihood
### Title: Export likelihood function for the HiSSE model
### Aliases: makeHiSSELikelihood
### Keywords: models

### ** Examples

## No test: 
library(diversitree)
library(hisse)
## Generate data:
pars <- c(0.1, 0.2, 0.03, 0.03, 0.01, 0.01)
set.seed(4) 
phy <- tree.bisse(pars, max.t=30, x0=0)
sim.dat <- data.frame(names(phy$tip.state), phy$tip.state)
## Get lik function:
lik.hisse <- makeHiSSELikelihood(phy = phy, data = sim.dat, hidden.states = FALSE)
likf <- lik.hisse$log.lik
pars <- lik.hisse$pars
## Set the parameter values. Note that we have turnover and eps, not speciation and extinction!
pars <- setNames(c(0.1+0.03,0.2+0.03,0.03/0.1,0.03/0.2,0.01,0.01), names(pars))
## Compute the log-likelihood for the model.
likf(pars)
## End(No test)



