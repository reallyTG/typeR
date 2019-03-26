library(diversitree)


### Name: make.bisse.td
### Title: Binary State Speciation and Extinction Model: Time Dependant
###   Models
### Aliases: make.bisse.t make.bisse.td
### Keywords: models

### ** Examples

set.seed(4)
pars <- c(0.1, 0.2, 0.03, 0.03, 0.01, 0.01)
phy <- tree.bisse(pars, max.t=30, x0=0)

## Suppose we want to see if diversification is different in the most
## recent 3 time units, compared with the rest of the tree (yes, this is
## a totally contrived example!):
plot(phy)
axisPhylo()
abline(v=max(branching.times(phy)) - 3, col="red", lty=3)

## For comparison, make a plain BiSSE likelihood function
lik.b <- make.bisse(phy, phy$tip.state)

## Create the time-dependent likelihood function.  The final argument
## here is the number of 'epochs' that are allowed.  Two epochs is one
## switch point.
lik.t <- make.bisse.td(phy, phy$tip.state, 2)

## The switch point is the first argument.  The remaining 12 parameters
## are the BiSSE parameters, with the first 6 being the most recent
## epoch.
argnames(lik.t)

pars.t <- c(3, pars, pars)
names(pars.t) <- argnames(lik.t)

## Calculations are identical to a reasonable tolerance:
lik.b(pars) - lik.t(pars.t)

## It will often be useful to constrain the time as a fixed quantity.
lik.t2 <- constrain(lik.t, t.1 ~ 3)

## Parameter estimation under maximum likelihood.  This is marked "don't
## run" because the time-dependent fit takes a few minutes.
## Not run: 
##D ## Fit the BiSSE ML model
##D fit.b <- find.mle(lik.b, pars)
##D 
##D ## And fit the BiSSE/td model
##D fit.t <- find.mle(lik.t2, pars.t[argnames(lik.t2)],
##D                   control=list(maxit=20000))
##D 
##D ## Compare these two fits with a likelihood ratio test (lik.t2 is nested
##D ## within lik.b)
##D anova(fit.b, td=fit.t)
## End(Not run)

## The time varying model (bisse.t)  is more general, but substantially
## slower.  Here, I will show that the two functions are equivalent for
## step function models.  We'll constrain all the non-lambda parameters
## to be the same over a time-switch at t=5.  This leaves 8 parameters.
lik.td <- make.bisse.td(phy, phy$tip.state, 2)
lik.td2 <- constrain(lik.td, t.1 ~ 5,          
                     mu0.2 ~ mu0.1, mu1.2 ~ mu1.1,
                     q01.2 ~ q01.1, q10.2 ~ q10.1)

lik.t <- make.bisse.t(phy, phy$tip.state,
                      rep(c("stepf.t", "constant.t"), c(2, 4)))
lik.t2 <- constrain(lik.t, lambda0.tc ~ 5, lambda1.tc ~ 5)

## Note that the argument names for these functions are different from
## one another.  This reflects different ways that the functions will
## tend to be used, but is potentially confusing here.
argnames(lik.td2)
argnames(lik.t2)

## First, evaluate the functions with no time effect and check that they
## are the same as the base BiSSE model
p.td <- c(pars, pars[1:2])
p.t <- pars[c(1, 1, 2, 2, 3:6)]

## All agree:
lik.b(pars)   # -159.7128
lik.td2(p.td) # -159.7128
lik.t2(p.t)   # -159.7128

## In fact, the time-varying BiSSE will tend to be identical to plain
## BiSSE where the functions to not change:
lik.b(pars) - lik.t2(p.t)

## Slight numerical differences are typical for the time-chunk BiSSE,
## because it forces the integration to be carried out more carefully
## around the switch point.
lik.b(pars) - lik.td2(p.td)

## Next, evaluate the functions with a time effect (5 time units ago,
## speciation rates were twice the contemporary rate)
p.td2 <- c(pars, pars[1:2]*2)
p.t2 <- c(pars[1], pars[1]*2, pars[2], pars[2]*2, pars[3:6])

## Huge drop in the likelihood (from -159.7128 to -172.7874)
lik.b(pars)
lik.td2(p.td2)
lik.t2(p.t2)

## The small difference remains between the two approaches, but they are
## basically the same.
lik.td2(p.td2) - lik.t2(p.t2)

## There is a small time cost to both time-dependent methods, 
## heavily paid for the time-chunk case:
system.time(lik.b(pars))
system.time(lik.td2(p.td))  # 1.9x slower than plain BiSSE
system.time(lik.td2(p.td2)) # 1.9x slower than plain BiSSE
system.time(lik.t2(p.t))    # about the same speed
system.time(lik.t2(p.t2))   # about the same speed



