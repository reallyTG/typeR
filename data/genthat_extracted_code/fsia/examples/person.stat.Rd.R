library(fsia)


### Name: person.stat
### Title: Person Statistics
### Aliases: person.stat

### ** Examples

data(test)
data(key)
data(weights)
data(weights_multiple)

testk <- addkey(test, keydata = key)
testw <- addweights(testk, weightsdata = weights)
testwm <- addweights(test, weightsdata = weights_multiple)

# number of correct responses for each person (only 4 items)
pst <- person.stat(obj = testk, col = 2:5)
pst
# sum of weights of correct responses for each person
pst <- person.stat(obj = testw, col = 2:5, weights = TRUE)
pst
# sum of weights of every response for each person
pst <- person.stat(obj = testwm, col = 2:5, weights = TRUE)
pst



