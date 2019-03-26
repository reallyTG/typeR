library(fsia)


### Name: item.stat
### Title: Item Statistics
### Aliases: item.stat

### ** Examples

data(test)
data(key)
data(weights)
data(weights_multiple)

testk <- addkey(test, keydata = key)
testw <- addweights(testk, weightsdata = weights)
testwm <- addweights(test, weightsdata = weights_multiple)

# number of correct responses for each item
ist <- item.stat(obj = testk, col = 2:41)
head(ist)
# sum of weights of correct responses for each item
ist <- item.stat(obj = testw, col = 2:41, weights = TRUE)
head(ist)
# sum of weights of every response for each item
ist <- item.stat(obj = testwm, col = 2:41, weights = TRUE)
head(ist)



