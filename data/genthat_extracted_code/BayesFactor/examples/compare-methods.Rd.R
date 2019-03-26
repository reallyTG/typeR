library(BayesFactor)


### Name: compare
### Title: Compare two models, with respect to some data
### Aliases: compare compare,BFoneSample,missing,data.frame-method
###   compare,BFlinearModel,BFlinearModel,data.frame-method
###   compare,BFindepSample,missing,data.frame-method
###   compare,BFlinearModel,missing,data.frame-method
###   compare,BFmetat,missing,data.frame-method
###   compare,BFproportion,missing,data.frame-method
###   compare,BFcontingencyTable,BFcontingencyTable,data.frame-method
###   compare,BFcontingencyTable,missing,data.frame-method
###   compare,BFcorrelation,missing,data.frame-method
###   compare,BFmcmc,BFmcmc,ANY-method compare,BFmcmc,missing,ANY-method

### ** Examples

## Sample from the posteriors for two models
data(puzzles)

## Main effects model; result is a BFmcmc object, inheriting
## mcmc from the coda package
mod1 = lmBF(RT ~ shape + color + ID, data = puzzles, whichRandom = "ID",
   progress = FALSE, posterior = TRUE, iterations = 1000)

plot(mod1)

## Full model
mod2 = lmBF(RT ~ shape*color + ID, data = puzzles, whichRandom = "ID",
   progress = FALSE, posterior = TRUE, iterations = 1000)

## Each BFmcmc object contains the model used to generate it, so we
## can compare them (data is not needed, it is contained in the objects):

compare(mod1, mod2)



