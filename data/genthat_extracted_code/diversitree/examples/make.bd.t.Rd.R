library(diversitree)


### Name: make.bd.t
### Title: Time-varing Birth-Death Models
### Aliases: make.bd.t
### Keywords: models

### ** Examples

## First, show equivalence to the plain Birth-death model.  This is not
## a very interesting use of the functions, but it serves as a useful
## check.

## Here is a simulated 25 species tree for testing.
set.seed(1)
pars <- c(.1, .03)
phy <- trees(pars, "bd", max.taxa=25)[[1]]

## Next, make three different likelihood functions: a "normal" one that
## uses the direct birth-death calculation, an "ode" based one (that
## uses numerical integration to compute the likelihood, and is
## therefore not exact), and one that is time-varying, but that the
## time-dependent functions are constant.t().
lik.direct <- make.bd(phy)
lik.ode <- make.bd(phy, control=list(method="ode"))
lik.t <- make.bd.t(phy, c("constant.t", "constant.t"))

lik.direct(pars) # -22.50267

## ODE-based likelihood calculations are correct to about 1e-6.
lik.direct(pars) - lik.ode(pars)

## The ODE calculation agrees exactly with the time-varying (but
## constant) calculation.
lik.ode(pars) - lik.t(pars)

## Next, make a real case, where speciation is a linear function of
## time.
lik.t2 <- make.bd.t(phy, c("linear.t", "constant.t"))

## Confirm that this agrees with the previous calculations when the
## slope is zero
pars2 <- c(pars[1], 0, pars[2])
lik.t2(pars2) - lik.t(pars)

## The time penalty comes from moving to the ODE-based solution, not
## from the time dependence.
system.time(lik.direct(pars)) # ~ 0.000
system.time(lik.ode(pars))    # ~ 0.003
system.time(lik.t(pars))      # ~ 0.003
system.time(lik.t2(pars2))    # ~ 0.003

## Not run: 
##D fit <- find.mle(lik.direct, pars)
##D fit.t2 <- find.mle(lik.t2, pars2)
##D 
##D ## No significant improvement in model fit:
##D anova(fit, time.varying=fit.t2)
## End(Not run)



