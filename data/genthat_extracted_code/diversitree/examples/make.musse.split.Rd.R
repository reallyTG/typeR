library(diversitree)


### Name: make.musse.split
### Title: Multiple State Speciation and Extinction Model: Split Models
### Aliases: make.musse.split
### Keywords: models

### ** Examples

## This example picks up from the tree used in the ?make.musse example.

## First, simulate the tree:
set.seed(2)
pars <- c(.1,  .15,  .2,  # lambda 1, 2, 3
          .03, .045, .06, # mu 1, 2, 3
          .05, 0,         # q12, q13
          .05, .05,       # q21, q23
          0,   .05)       # q31, q32
phy <- tree.musse(pars, 30, x0=1)

## Here is the phylogeny, with true character history superposed:
h <- history.from.sim.discrete(phy, 1:3)
plot(h, phy, show.node.label=TRUE, font=1, cex=.75, no.margin=TRUE)

## Here is a plain MuSSE function for later comparison:
lik.m <- make.musse(phy, phy$tip.state, 3)
lik.m(pars) # -110.8364

## Split this phylogeny at three points: nd16 and nd25, splitting it
## into three chunks
nodes <- c("nd16", "nd25")
nodelabels(node=match(nodes, phy$node.label) + length(phy$tip.label),
           pch=19, cex=2, col="#FF000099")

## To make a split BiSSE function, pass the node locations and times
## in.  Here, we'll use 'Inf' as the split time to mimick MEDUSA's
## behaviour of placing the split at the base of the branch subtended by
## a node.
lik.s <- make.musse.split(phy, phy$tip.state, 3, nodes, split.t=Inf)

## The parameters must be a list of the same length as the number of
## partitions.  Partition '1' is the root partition, and partition i is
## the partition rooted at the node[i-1]:
argnames(lik.s)

## Because we have two nodes, there are three sets of parameters.
## Replicate the original list to get a starting point for the analysis:
pars.s <- rep(pars, 3)
names(pars.s) <- argnames(lik.s)

lik.s(pars.s) # -110.8364

## This is basically identical (to acceptable tolerance) to the plain
## MuSSE version:
lik.s(pars.s) - lik.m(pars)

## The resulting likelihood function can be used in ML analyses with
## find.mle.  However, because of the large number of parameters, this
## may take some time (especially with as few species as there are in
## this tree - getting convergence in a reasonable number of iterations
## is difficult).
## Not run: 
##D fit.s <- find.mle(lik.s, pars.s, control=list(maxit=20000))
## End(Not run)

## Bayesian analysis also works, using the mcmc function.  Given the
## large number of parameters, priors will be essential, as there will
## be no signal for several parameters.  Here, I am using an exponential
## distribution with a mean of twice the state-independent
## diversification rate.
## Not run: 
##D prior <- make.prior.exponential(1/(-2*diff(starting.point.bd(phy))))
##D samples <- mcmc(lik.s, pars.s, 100, prior=prior, w=1, print.every=10)
## End(Not run)



