library(BayesFactor)


### Name: extractBF
### Title: Extract the Bayes factor from an object
### Aliases: extractBF extractBF,BFBayesFactor-method

### ** Examples

## Sample from the posteriors for two models
data(puzzles)

bf = lmBF(RT ~ shape*color + ID, data = puzzles, whichRandom="ID", progress=FALSE)

extractBF(bf)



