library(nopaco)


### Name: $,ConcordanceTest-method
### Title: Extract argument values from a ConcordanceTest object
### Aliases: $,ConcordanceTest-method get,ConcordanceTest-method

### ** Examples


matRandom <- matrix(rnorm(3*20),20,3)
testResult <- concordance.test(matRandom)
names(testResult)
testResult$psi



