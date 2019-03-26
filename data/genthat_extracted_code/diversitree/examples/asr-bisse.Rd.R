library(diversitree)


### Name: asr-bisse
### Title: Ancestral State Reconstruction Under BiSSE
### Aliases: asr.bisse asr.musse asr.marginal.bisse asr.marginal.musse
###   make.asr.marginal.bisse make.asr.marginal.musse
### Keywords: model

### ** Examples

## Start with a simple tree evolved under a BiSSE with all rates
## asymmetric:
pars <- c(.1, .2, .03, .06, .01, .02)
set.seed(3)
phy <- trees(pars, "bisse", max.taxa=50, max.t=Inf, x0=0)[[1]]

## Here is the true history
h <- history.from.sim.discrete(phy, 0:1)
plot(h, phy, main="True history")

## Not run: 
##D ## BiSSE ancestral state reconstructions under the ML model
##D lik <- make.bisse(phy, phy$tip.state)
##D fit <- find.mle(lik, pars, method="subplex")
##D st <- asr.marginal(lik, coef(fit))
##D nodelabels(thermo=t(st), piecol=1:2, cex=.5)
##D 
##D ## Mk2 ancestral state reconstructions, ignoring the shifts in
##D ## diversification rates:
##D lik.m <- make.mk2(phy, phy$tip.state)
##D fit.m <- find.mle(lik.m, pars[5:6], method="subplex")
##D st.m <- asr.marginal(lik.m, coef(fit.m))
##D ## The Mk2 results have more uncertainty at the root, but both are
##D ## similar.
##D nodelabels(thermo=t(st.m), piecol=1:2, cex=.5, adj=-.5)
##D 
##D ## (This section will take 10 or so minutes to run.)
##D ## Try integrating over parameter uncertainty and comparing the BiSSE
##D ## with Mk2 output:
##D prior <- make.prior.exponential(2)
##D samples <- mcmc(lik, coef(fit), 1000, w=1, prior=prior,
##D                 print.every=100)
##D st.b <- apply(samples[2:7], 1, function(x) asr.marginal(lik, x)[2,])
##D st.b.avg <- rowMeans(st.b)
##D 
##D samples.m <- mcmc(lik.m, coef(fit.m), 1000, w=1, prior=prior,
##D                   print.every=100)
##D st.m <- apply(samples.m[2:3], 1, function(x) asr.marginal(lik.m, x)[2,])
##D st.m.avg <- rowMeans(st.m)
##D 
##D ## These end up being more striking in their similarity than their
##D ## differences, except for the root node, where BiSSE remains more sure
##D ## that is in state 0 (there is about 0.05 red there).
##D plot(h, phy, main="Marginal ASR, BiSSE (left), Mk2 (right)",
##D      show.node.state=FALSE)
##D nodelabels(thermo=1-st.b.avg, piecol=1:2, cex=.5)
##D nodelabels(thermo=1-st.m.avg, piecol=1:2, cex=.5, adj=-.5)
##D 
##D ## Equivalency of Mk2 and BiSSE where diversification is state
##D ## independent.  For any values of lambda/mu (here .1 and .03) where
##D ## these do not vary across character states, these two methods will
##D ## give essentially identical marginal ancestral state reconstructions.
##D st.id <- asr.marginal(lik, c(.1, .1, .03, .03, coef(fit.m)))
##D st.id.m <- asr.marginal(lik.m, coef(fit.m))
##D 
##D ## Reconstructions are identical to a relative tolerance of 1e-7
##D ## (0.0000001), which is similar to the expected tolerance of the BiSSE
##D ## calculations.
##D all.equal(st.id, st.id.m, tolerance=1e-7)
##D 
##D ## Equivalency of BiSSE and MuSSE reconstructions for two states:
##D lik.b <- make.bisse(phy, phy$tip.state)
##D lik.m <- make.musse(phy, phy$tip.state + 1, 2)
##D 
##D st.b <- asr.marginal(lik.b, coef(fit))
##D st.m <- asr.marginal(lik.m, coef(fit))
##D 
##D all.equal(st.b, st.m)
## End(Not run)



