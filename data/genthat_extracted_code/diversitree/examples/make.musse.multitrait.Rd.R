library(diversitree)


### Name: make.musse.multitrait
### Title: MuSSE: Multi-State Speciation and Extinction (Multiple Binary
###   Traits Version)
### Aliases: make.musse.multitrait make.mkn.multitrait
###   musse.multitrait.translate mkn.multitrait.translate
###   starting.point.musse.multitrait
### Keywords: models

### ** Examples

## The translation between these two bases is fairly straightforward; if
## we have a vector of parameters in our new basis 'p' we can convert it
## into the original MuSSE basis ('q') through this matrix:
tr <- musse.multitrait.translate(2)
tr

## Notice that the rows that correspond to transitions in multiple
## traits are all zero by default; this means that these q values will
## be zero regardless of the parameter vector used.
tr["q00.11",]

## And here is the section of the transition matrix corresponding to the
## lambda values; every rate gets a contribution from the intercept term
## (lambda0), lambda10 and lambda11 get a contribution from lambdaA, etc.
tr[1:4,1:4]

## There is currently no nice simulation support for this, so bear with
## an ugly script to generate the tree and traits.
pars <- c(.10, .15, .20, .25, # lambda 00, 10, 01, 11
          .03, .03, .03, .03, # mu 00, 10, 01, 11
          .05, .05, .0,       # q00.10, q00.01, q00.11
          .05, .0,  .05,      # q10.00, q10.01, q10.11
          .05, .0,  .05,      # q01.00, q01.10, q01.11
          .0,  .05, .05)      # q11.00, q11.10, q11.01
set.seed(2)
phy <- tree.musse(pars, 60, x0=1)

states <- expand.grid(A=0:1, B=0:1)[phy$tip.state,]
rownames(states) <- phy$tip.label

## Here, states has row names corresponding to the different taxa, and
## the states of two traits "A" and "B" are recorded in the columns.
head(states)

## Note that transition from the original MuSSE basis to this basis is
## only possible in general when depth=n.trait and allow.multistep=TRUE
## (as only this generates a square matrix that is invertible).
## However, when it is possible to express the set of parameters in the
## new basis (as it is above), this can be done through a pseudoinverse
## (here, a left inverse).
pars2 <- drop(solve(t(tr) %*% tr) %*% t(tr) %*% pars)

## Going from our new basis to the original MuSSE parameters is always
## straightforward.  This is done automatically in the likelihood
## function.
all.equal(drop(tr %*% pars2), pars, check.attributes=FALSE)

## This shows that the two traits act additively on speciation rate
## (lambdaAB is zero), that there is no effect of any trait on
## extinction (the only nonzero mu parameter is mu0) and transition
## rates for one trait are unaffected by other traits (the only nonzero
## q parameters are the qXij.0 parameters; qXij.Y parameters are all
## zero).

## Here is our new MuSSE function parametrised as a multi-trait
## function:
lik <- make.musse.multitrait(phy, states)

## Here are the argument names for the likelihood function.
argnames(lik)

## Basic MuSSE function for comparison
lik.m <- make.musse(phy, phy$tip.state, 4)
argnames(lik.m)

## Rather than fit this complicated model first, let's start with a
## simple model with no state dependent diversification.  This model
## allows the forwards and backwards transition rates to vary, but the
## speciation and extinction rates do not depend on the character
## state:
lik0 <- make.musse.multitrait(phy, states, depth=0)
argnames(lik0)

## This can be used in analyses as usual.  However, this can take a
## while to run, so is not run by default.
## Not run: 
##D p <- starting.point.musse.multitrait(phy, lik0)
##D fit0 <- find.mle(lik0, p)
##D 
##D ## Now, allow the speciation rates to vary additively with both
##D ## character states (extinction and character changes are left as in the
##D ## previous model)
##D lik1 <- make.musse.multitrait(phy, states, depth=c(1, 0, 0))
##D 
##D ## Start from the previous ML point:
##D p <- starting.point.musse.multitrait(phy, lik1)
##D p[names(coef(fit0))] <- coef(fit0)
##D 
##D fit1 <- find.mle(lik1, p)
##D 
##D ## The likelihood improves, but the difference is not statistically
##D ## significant (p = 0.35).
##D anova(fit1, fit0)
##D 
##D ## We can fit an interaction for the speciation rates, too:
##D lik2 <- make.musse.multitrait(phy, states, depth=c(2, 0, 0))
##D p <- starting.point.musse.multitrait(phy, lik2)
##D p[names(coef(fit1))] <- coef(fit1)
##D fit2 <- find.mle(lik2, p)
##D 
##D ## There is next to no support for the interaction term (which is good,
##D ## as the original model did not have any interaction!)
##D anova(fit2, fit1)
##D 
##D ## Constraining also works with these models.  For example, constraining
##D ## the lambdaA parameter to zero:
##D lik1b <- constrain(lik1, lambdaA ~ 0)
##D argnames(lik1b)
##D p <- starting.point.musse.multitrait(phy, lik1b)
##D p[names(coef(fit0))] <- coef(fit0)
##D fit1b <- find.mle(lik1b, p)
##D anova(fit1b, fit0)
##D 
##D ## Or constraining both main effects to take the same value:
##D lik1c <- constrain(lik1, lambdaB ~ lambdaA)
##D argnames(lik1c)
##D p <- starting.point.musse.multitrait(phy, lik1c)
##D p[names(coef(fit0))] <- coef(fit0)
##D fit1c <- find.mle(lik1c, p)
##D anova(fit1c, fit0)
## End(Not run)



