library(BayesFactor)


### Name: posterior
### Title: Sample from the posterior distribution of one of several models.
### Aliases: posterior posterior,BFmodel,missing,data.frame,missing-method
###   posterior,BFBayesFactor,missing,missing,missing-method
###   posterior,BFBayesFactor,numeric,missing,numeric-method
###   posterior,BFBayesFactor,missing,missing,numeric-method
###   posterior,BFlinearModel,missing,data.frame,numeric-method
###   posterior,BFindepSample,missing,data.frame,numeric-method
###   posterior,BFcontingencyTable,missing,data.frame,numeric-method
###   posterior,BFoneSample,missing,data.frame,numeric-method
###   posterior,BFmetat,missing,data.frame,numeric-method
###   posterior,BFproportion,missing,data.frame,numeric-method
###   posterior,BFcorrelation,missing,data.frame,numeric-method

### ** Examples

## Sample from the posteriors for two models
data(sleep)

bf = lmBF(extra ~ group + ID, data = sleep, whichRandom="ID", progress=FALSE)

## sample from the posterior of the numerator model
## data argument not needed - it is included in the Bayes factor object
chains = posterior(bf, iterations = 1000, progress = FALSE)

plot(chains)

## demonstrate column filtering by filtering out participant effects
data(puzzles)
bf = lmBF(RT ~ shape + color + shape:color + ID, data=puzzles)
chains = posterior(bf, iterations = 1000, progress = FALSE, columnFilter="^ID$")
colnames(chains) # Contains no participant effects



