library(diversitree)


### Name: make.bisse
### Title: Binary State Speciation and Extinction Model
### Aliases: make.bisse starting.point.bisse
### Keywords: models

### ** Examples

pars <- c(0.1, 0.2, 0.03, 0.03, 0.01, 0.01)
set.seed(4)
phy <- tree.bisse(pars, max.t=30, x0=0)

## Here is the 52 species tree with the true character history coded.
## Red is state '1', which has twice the speciation rate of black (state
## '0').
h <- history.from.sim.discrete(phy, 0:1)
plot(h, phy)

lik <- make.bisse(phy, phy$tip.state)
lik(pars) # -159.71

## Heuristic guess at a starting point, based on the constant-rate
## birth-death model (uses make.bd).
p <- starting.point.bisse(phy)

## Not run: 
##D ## Start an ML search from this point.  This takes some time (~7s)
##D fit <- find.mle(lik, p, method="subplex")
##D logLik(fit) # -158.6875
##D 
##D ## The estimated parameters aren't too far away from the real ones, even
##D ## with such a small tree
##D rbind(real=pars,
##D       estimated=round(coef(fit), 2))
##D 
##D ## Test a constrained model where the speciation rates are set equal
##D ## (takes ~4s).
##D lik.l <- constrain(lik, lambda1 ~ lambda0)
##D fit.l <- find.mle(lik.l, p[-1], method="subplex")
##D logLik(fit.l) # -158.7357
##D 
##D ## Despite the difference in the estimated parameters, there is no
##D ## statistical support for this difference:
##D anova(fit, equal.lambda=fit.l)
##D 
##D ## Run an MCMC.  Because we are fitting six parameters to a tree with
##D ## only 50 species, priors will be needed.  I will use an exponential
##D ## prior with rate 1/(2r), where r is the character independent
##D ## diversificiation rate:
##D prior <- make.prior.exponential(1 / (2 * (p[1] - p[3])))
##D 
##D ## This takes quite a while to run, so is not run by default
##D tmp <- mcmc(lik, fit$par, nsteps=100, prior=prior, w=.1, print.every=0)
##D 
##D w <- diff(sapply(tmp[2:7], range))
##D samples <- mcmc(lik, fit$par, nsteps=1000, prior=prior, w=w,
##D                 print.every=100)
##D 
##D ## See profiles.plot for more information on plotting these
##D ## profiles.
##D col <- c("blue", "red")
##D profiles.plot(samples[c("lambda0", "lambda1")], col.line=col, las=1,
##D               xlab="Speciation rate", legend="topright")
## End(Not run)

## BiSSE reduces to the birth-death model and Mk2 when diversification
## is state independent (i.e., lambda0 ~ lambda1 and mu0 ~ mu1).
lik.mk2 <- make.mk2(phy, phy$tip.state)
lik.bd <- make.bd(phy)

## 1. BiSSE / Birth-Death
## Set the q01 and q10 parameters to arbitrary numbers (need not be
## symmetric), and constrain the lambdas and mus to be the same for each
## state.  The likelihood function now has just two parameters and
## will be proprtional to Nee's birth-death based likelihood:
lik.bisse.bd <- constrain(lik,
                          lambda1 ~ lambda0, mu1 ~ mu0,
                          q01 ~ .01, q10 ~ .02)
pars <- c(.1, .03)
## These differ by -167.3861 for both parameter sets:
lik.bisse.bd(pars)   - lik.bd(pars)
lik.bisse.bd(2*pars) - lik.bd(2*pars)

## 2. BiSSE / Mk2
## Same idea as above: set all diversification parameters to arbitrary
## values (but symmetric this time):
lik.bisse.mk2 <- constrain(lik,
                           lambda0 ~ .1, lambda1 ~ .1,
                           mu0 ~ .03, mu1 ~ .03)
## Differ by -150.4740 for both parameter sets.
lik.bisse.mk2(pars)   - lik.mk2(pars)
lik.bisse.mk2(2*pars) - lik.mk2(2*pars)

## 3. Sampled BiSSE / Birth-Death
## Pretend that the tree is only .6 sampled:
lik.bd2 <- make.bd(phy, sampling.f=.6)
lik.bisse2 <- make.bisse(phy, phy$tip.state, sampling.f=c(.6, .6))
lik.bisse2.bd <- constrain(lik.bisse2,
                           lambda1 ~ lambda0, mu1 ~ mu0,
                           q01 ~ .01, q10 ~ .01)

## Difference of -167.2876
lik.bisse2.bd(pars)   - lik.bd2(pars)
lik.bisse2.bd(2*pars) - lik.bd2(2*pars)

## 4. Unresolved clade BiSSE / Birth-Death
set.seed(1)
unresolved <- data.frame(tip.label=I(sample(phy$tip.label, 5)),
                         Nc=sample(2:10, 5), n0=0, n1=0)
unresolved.bd <- structure(unresolved$Nc, names=unresolved$tip.label)
lik.bisse3 <- make.bisse(phy, phy$tip.state, unresolved)
lik.bisse3.bd <- constrain(lik.bisse3,
                           lambda1 ~ lambda0, mu1 ~ mu0,
                           q01 ~ .01, q10 ~ .01)
lik.bd3 <- make.bd(phy, unresolved=unresolved.bd)

## Difference of -167.1523
lik.bisse3.bd(pars) - lik.bd3(pars)
lik.bisse3.bd(pars*2) - lik.bd3(pars*2)



