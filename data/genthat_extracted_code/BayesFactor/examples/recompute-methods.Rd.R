library(BayesFactor)


### Name: recompute
### Title: Recompute a Bayes factor computation or MCMC object.
### Aliases: recompute recompute,BFBayesFactor-method
###   recompute,BFBayesFactorTop-method recompute,BFBayesFactor-method
###   recompute,BFmcmc-method recompute,BFodds-method

### ** Examples

## Sample from the posteriors for two models
data(puzzles)

## Main effects model; result is a BFmcmc object, inheriting
## mcmc from the coda package
bf = lmBF(RT ~ shape + color + ID, data = puzzles, whichRandom = "ID",
   progress = FALSE)

## recompute Bayes factor object
recompute(bf, iterations = 1000, progress = FALSE)

## Sample from posterior distribution of model above, and recompute:
chains = posterior(bf, iterations = 1000, progress = FALSE)
newChains = recompute(chains, iterations = 1000, progress=FALSE)



