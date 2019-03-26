library(diversitree)


### Name: make.bisseness
### Title: Binary State Speciation and Extinction (Node Enhanced State
###   Shift) Model
### Aliases: make.bisseness
### Keywords: models

### ** Examples

## First we simulat a 50 species tree, assuming cladogenetic shifts in 
## the trait (i.e., the trait only changes at speciation).
## Red is state '1', black is state '0', and we let red lineages
## speciate at twice the rate of black lineages.
## The simulation starts in state 0.
set.seed(3)
pars <- c(0.1, 0.2, 0.03, 0.03, 0, 0, 0.1, 0, 0.1, 0)
phy <- tree.bisseness(pars, max.taxa=50, x0=0)
phy$tip.state

h <- history.from.sim.discrete(phy, 0:1)
plot(h, phy)

## This builds the likelihood of the data according to BiSSEness:
lik <- make.bisseness(phy, phy$tip.state)
## e.g., the likelihood of the true parameters is:
lik(pars) # -174.7954

## ML search:  First we make hueristic guess at a starting point, based
## on the constant-rate birth-death model assuming anagenesis (uses
## make.bd).
startp <- starting.point.bisse(phy)

## We then take the total amount of anagenetic change expected across
## the tree and assign half of this change to anagenesis and half to
## cladogenetic change at the nodes as a heuristic starting point:
t <- branching.times(phy)
tryq <- 1/2 * startp[["q01"]] * sum(t)/length(t)
p <- c(startp[1:4], startp[5:6]/2, p0c=tryq, p0a=0.5, p1c=tryq, p1a=0.5)

## Start an ML search from this point.  This takes some time (~12s), so
## is not run by default.
## Not run: 
##D fit <- find.mle(lik, p, method="subplex")
##D logLik(fit) # -174.0104
##D 
##D ## Compare the fit to a constrained model that only allows the trait
##D ## to change along a lineage (anagenesis).  This also takes some time
##D ## (~12s)
##D lik.no.clado <- constrain(lik, p0c ~ 0, p1c ~ 0)
##D fit.no.clado <- find.mle(lik.no.clado,p[argnames(lik.no.clado)])
##D logLik(fit.no.clado) # -174.0577
##D 
##D ## This is consistent with what BiSSE finds:
##D likB <- make.bisse(phy, phy$tip.state)
##D fitB <- find.mle(likB, startp, method="subplex")
##D logLik(fitB) # -174.0576
##D 
##D ## With only this 50-species tree, there is no statistical support
##D ## for the more complicated BiSSE-ness model that allows cladogenesis:
##D anova(fit, no.clado=fit.no.clado)
##D ## Note that anova() performs a likelihood ratio test here.
##D 
##D ## If the above is repeated with max.taxa=250, BiSSE-ness rejects the
##D ## constrained model in favor of one that allows cladogenetic change.
##D 
##D ## MCMC run: We use the ML estimate from the full model
##D ## as a starting point.
##D ##
##D ## We shift all very small numbers up to 1e-4 to allow the derivatives
##D ## to be calculated.
##D ml.start.pt <- pmax(coef(fit), 1e-4)
##D 
##D ## Make exponential priors for the rate parameters and uniform priors
##D ## for the cladogenetic change probability prarameters.
##D make.prior.exp_ness <- function(r, min=0, max=1) {
##D   function(pars) {
##D     sum(dexp(pars[1:6], rate=r, log=TRUE)) +
##D       sum(dunif(pars[7:10], min, max, log=TRUE))
##D   }
##D }
##D 
##D ## Choosing the slice sampling parameter, w (affects speed):
##D library(numDeriv)
##D hess <- hessian(lik, ml.start.pt)
##D vcv <- -solve(hess)
##D sehess <- sqrt(abs(diag(vcv)))
##D w <- 2 * pmin(sehess, .2)
##D 
##D ## Setting the priors
##D r <- log(length(phy$tip.label))/max(branching.times(phy))
##D prior <- make.prior.exp_ness(1/(2*r))
##D prior(ml.start.pt)
##D 
##D ## Running the mcmc chain (only 10 steps are shown for illustration)
##D steps <- 10
##D set.seed(1) # For reproducibility
##D output <- mcmc(lik, ml.start.pt, nsteps=steps, w=w, prior=prior)
##D 
##D ## Unresolved tip clade: Here we collapse one clade in the 50 species
##D ## tree (involving sister species sp70 and sp71) and illustrate the use
##D ## of BiSSEness with unresolved tip clades.
##D slimphy <- drop.tip(phy,c("sp71"))
##D states <- slimphy$tip.state[slimphy$tip.label]
##D states["sp70"] <- NA
##D unresolved <- data.frame(tip.label=c("sp70"), Nc=2, n0=2, n1=0)
##D 
##D ## This builds the likelihood of the data according to BiSSEness:
##D lik.unresolved <- make.bisseness(slimphy, states, unresolved)
##D ## e.g., the likelihood of the true parameters is:
##D lik.unresolved(pars) # -174.6575
##D 
##D ## ML search from the heuristic starting point used above:
##D fit.unresolved <- find.mle(lik.unresolved, p, method="subplex")
##D logLik(fit.unresolved) # -173.9136
## End(Not run)



