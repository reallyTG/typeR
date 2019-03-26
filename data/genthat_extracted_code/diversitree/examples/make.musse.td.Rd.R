library(diversitree)


### Name: make.musse.td
### Title: Multiple State Speciation and Extinction Model: Time Dependent
###   Models
### Aliases: make.musse.t make.musse.td
### Keywords: models

### ** Examples

## Here we will start with the tree and three-state character set from
## the make.musse example.  This is a poorly contrived example.
pars <- c(.1,  .15,  .2,  # lambda 1, 2, 3
          .03, .045, .06, # mu 1, 2, 3
          .05, 0,         # q12, q13
          .05, .05,       # q21, q23
          0,   .05)       # q31, q32
set.seed(2)
phy <- tree.musse(pars, 30, x0=1)

## Suppose we want to see if diversification is different in the most
## recent 3 time units, compared with the rest of the tree (yes, this is
## a totally contrived example!):
plot(phy)
axisPhylo()
abline(v=max(branching.times(phy)) - 3, col="red", lty=3)

## For comparison, make a plain MuSSE likelihood function
lik.m <- make.musse(phy, phy$tip.state, 3)

## Create the time-dependent likelihood function.  The final argument
## here is the number of 'epochs' that are allowed.  Two epochs is one
## switch point.
lik.t <- make.musse.td(phy, phy$tip.state, 3, 2)

## The switch point is the first argument.  The remaining 12 parameters
## are the MuSSE parameters, with the first 6 being the most recent
## epoch.
argnames(lik.t)

pars.t <- c(3, pars, pars)
names(pars.t) <- argnames(lik.t)

## Calculations are identical to a reasonable tolerance:
lik.m(pars) - lik.t(pars.t)

## It will often be useful to constrain the time as a fixed quantity.
lik.t2 <- constrain(lik.t, t.1 ~ 3)

## Parameter estimation under maximum likelihood.  This is marked "don't
## run" because the time-dependent fit takes a few minutes.
## Not run: 
##D ## Fit the MuSSE ML model
##D fit.m <- find.mle(lik.m, pars)
##D 
##D ## And fit the MuSSE/td model
##D fit.t <- find.mle(lik.t2, pars.t[argnames(lik.t2)],
##D                   control=list(maxit=20000))
##D 
##D ## Compare these two fits with a likelihood ratio test (lik.t2 is nested
##D ## within lik.m)
##D anova(fit.m, td=fit.t)
## End(Not run)



