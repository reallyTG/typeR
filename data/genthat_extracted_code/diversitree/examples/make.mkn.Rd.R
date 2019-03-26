library(diversitree)


### Name: make.mkn
### Title: Mk2 and Mk-n Models of character evolution
### Aliases: make.mkn make.mk2 make.mkn.meristic
### Keywords: models

### ** Examples

## Simulate a tree and character distribution.  This is on a birth-death
## tree, with high rates of character evolution and an asymmetry in the
## character transition rates.
pars <- c(.1, .1, .03, .03, .1, .2)
set.seed(3)
phy <- trees(pars, "bisse", max.taxa=25, max.t=Inf, x0=0)[[1]]

## Here is the 25 species tree with the true character history coded.
## Red is state '1', which has twice the character transition rate of
## black (state '0').
h <- history.from.sim.discrete(phy, 0:1)
plot(h, phy)

## Maximum likelihood parameter estimation:
p <- c(.1, .1) # initial parameter guess

## Not run: 
##D lik <- make.mk2(phy, phy$tip.state)
##D fit.mk2 <- find.mle(lik, p)
##D coef(fit.mk2)   # q10 >> q01
##D logLik(fit.mk2) # -10.9057
##D 
##D ## This can also be done using the more general Mk-n.
##D ## This uses an approximation for the likelihood calculations.  make.mkn
##D ## assumes that states are numbered 1, 2, ..., k, so 1 needs to be added
##D ## to the states returned by trees.
##D lik.mkn <- make.mkn(phy, phy$tip.state + 1, 2)
##D fit.mkn <- find.mle(lik.mkn, p)
##D fit.mkn[1:2]
##D 
##D ## These are the same (except for the naming of arguments)
##D all.equal(fit.mkn[-7], fit.mk2[-7], check.attr=FALSE, tolerance=1e-7)
##D 
##D ## Equivalence to ape's ace function:
##D model <- matrix(c(0, 2, 1, 0), 2)
##D fit.ape <- ace(phy$tip.state, phy, "discrete", model=model, ip=p)
##D 
##D ## To do the comparison, we need to rerun the diversitree version with
##D ## the same root conditions as ape.
##D fit.mk2 <- find.mle(lik, p, root=ROOT.GIVEN, root.p=c(1,1))
##D 
##D ## These are the same to a reasonable degree of accuracy, too (the
##D ## matrix exponentiation is slightly less accurate than the ODE
##D ## solving approach.  The make.mk2 version is exact)
##D all.equal(fit.ape[c("rates", "loglik")], fit.mk2[1:2],
##D           check.attributes=FALSE, tolerance=1e-4)
##D 
##D ## The ODE calculation method may be useful when there are a large
##D ## number of possible states (say, over 20).
##D lik.ode <- make.mkn(phy, phy$tip.state + 1, 2,
##D                     control=list(method="ode"))
##D fit.ode <- find.mle(lik.ode, p)
##D fit.ode[1:2]
##D 
##D all.equal(fit.ode[-7], fit.mkn[-7], tolerance=1e-7)
## End(Not run)



