library(diversitree)


### Name: find.mle
### Title: Maximimum Likelihood Inference
### Aliases: find.mle coef.fit.mle logLik.fit.mle anova.fit.mle
### Keywords: models

### ** Examples

pars <- c(0.1, 0.2, 0.03, 0.03, 0.01, 0.01)
set.seed(2)
phy <- tree.bisse(pars, max.t=60, x0=0)

## Here is the 203 species tree with the true character history coded.
## Red is state '1', which has twice the speciation rate of black (state
## '0').
h <- history.from.sim.discrete(phy, 0:1)
plot(h, phy, cex=.5, show.node.state=FALSE)

## Make a BiSSE likelihood function
lik <- make.bisse(phy, phy$tip.state)
lik(pars)

## This takes ~30s to run, so is not enabled by default
## Not run: 
##D ## Fit the full six-parameter model
##D fit <- find.mle(lik, pars)
##D fit[1:2]
##D 
##D coef(fit)   # Named vector of six parameters
##D logLik(fit) # -659.93
##D AIC(fit)    # 1331.86
##D 
##D ## find.mle works with constrained models (see constrain).  Here
##D ## the two speciation rates are constrained to be the same as each
##D ## other.
##D lik.l <- constrain(lik, lambda0 ~ lambda1)
##D fit.l <- find.mle(lik.l, pars[-2])
##D logLik(fit.l) # 663.41
##D 
##D ## Compare the models with anova - this shows that the more
##D ## complicated model with two separate speciation rates fits
##D ## significantly better than the simpler model with equal rates
##D ## (p=0.008).
##D anova(fit, equal.lambda=fit.l)
##D 
##D ## You can return the parameters for the full six parameter model from
##D ## the fitted five parameter model - this makes a good starting point
##D ## for a ML search.
##D coef(fit.l, full=TRUE)
## End(Not run)



