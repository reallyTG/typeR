library(fsia)


### Name: addweights
### Title: Add a Weights to a Data Frame
### Aliases: addweights

### ** Examples

data(test)
data(key)
data(weights)
data(weights_multiple)
testk <- addkey(test, keydata = key)
testw <- addweights(testk, weightsdata = weights)
testwm <- addweights(test, weightsdata = weights_multiple)



