library(BayesFactor)


### Name: model.matrix,BFBayesFactor-method
### Title: Design matrices for Bayes factor linear models analyses.
### Aliases: model.matrix,BFBayesFactor-method model.matrix,BFBayesFactor
###   model.matrix,BFBayesFactorTop-method model.matrix,BFBayesFactor

### ** Examples

## Gets the design matrix for a simple analysis
data(sleep)

bf = anovaBF(extra ~ group + ID, data = sleep, whichRandom="ID", progress=FALSE)
X = model.matrix(bf)

## Show dimensions of X (should be 20 by 12)
dim(X)



