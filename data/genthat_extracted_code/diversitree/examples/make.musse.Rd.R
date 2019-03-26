library(diversitree)


### Name: make.musse
### Title: MuSSE: Multi-State Speciation and Extinction
### Aliases: make.musse starting.point.musse
### Keywords: models

### ** Examples

## 1: BiSSE equivalence
pars <- c(.1, .2, .03, .04, 0.05, 0.1)
set.seed(2)
phy <- tree.musse(pars, 20, x0=1)

## Show that the likelihood functions give the same answers.  Ignore the
## warning when creating the MuSSE function.
lik.b <- make.bisse(phy, phy$tip.state-1)
lik.m <- make.musse(phy, phy$tip.state, 2)
all.equal(lik.b(pars), lik.m(pars), tolerance=1e-7)

## Notice that default argument names are different between BiSSE and
## MuSSE, but that the order is the same.
argnames(lik.b) # BiSSE: 0/1
argnames(lik.m) # MuSSE: 1/2

## 2: A 3-state example where movement is only allowed between
## neighbouring states (1 <-> 2 <-> 3), and where speciation and
## extinction rates increase moving from 1 -> 2 -> 3:

## You can get the expected argument order for any number of states
## this way (sorry - clunky).  The help file also lists the order.
diversitree:::default.argnames.musse(3)

## Here are the parameters:
pars <- c(.1,  .15,  .2,  # lambda 1, 2, 3
          .03, .045, .06, # mu 1, 2, 3
          .05, 0,         # q12, q13
          .05, .05,       # q21, q23
          0,   .05)       # q31, q32

set.seed(2)
phy <- tree.musse(pars, 30, x0=1)

## Extract history from simulated tree and plot
## (colours are 1: black, 2: red, 3: blue)
col <- c("blue", "orange", "red")
h <- history.from.sim.discrete(phy, 1:3)
plot(h, phy, cex=.7, col=col)

## The states are numbered 1:3, rather than 0:1 in bisse.
states <- phy$tip.state
table(states)

## 2: Likelihood
## Making a likelihood function is basically identical to bisse.  The
## third argument needs to be the number of states.  In a future
## version this will probably be max(states), but there are some
## pitfalls about this that I am still worried about.
lik <- make.musse(phy, states, 3)

## Here are the arguments.  Even with three states, this is getting
## ridiculous.
argnames(lik)

## Start with a fully constrained model, but still enforcing stepwise
## changes (disallowing 1 <-> 3 shifts)
lik.base <- constrain(lik, lambda2 ~ lambda1, lambda3 ~ lambda1,
                      mu2 ~ mu1, mu3 ~ mu1,
                      q13 ~ 0, q21 ~ q12, q23 ~ q12, q31 ~ 0, q32 ~ q12)

## Not run: 
##D p <- starting.point.musse(phy, 3)
##D fit.base <- find.mle(lik.base, p[argnames(lik.base)])
##D 
##D ## Now, allow the speciation rates to vary:
##D lik.lambda <- constrain(lik, mu2 ~ mu1, mu3 ~ mu1,
##D                         q13 ~ 0, q21 ~ q12, q23 ~ q12, q31 ~ 0, q32 ~ q12)
##D fit.lambda <- find.mle(lik.lambda, p[argnames(lik.lambda)])
##D 
##D ## Very little improvement in fit (this *is* a small tree)
##D anova(fit.base, lambda=fit.lambda)
##D 
##D ## Run an MCMC with this set.  Priors will be necessary (using the
##D ## usual exponential with mean of 2r)
##D prior <- make.prior.exponential(1 / (2 * (p[1] - p[4])))
##D samples <- mcmc(lik.lambda, coef(fit.lambda), nstep=1000, w=1,
##D                 prior=prior, print.every=50)
##D 
##D ## Posterior probability profile plots for the three speciation rates.
##D profiles.plot(samples[2:4], col)
##D abline(v=c(.1, .15, .2), col=col)
## End(Not run)



