library(nopaco)


### Name: coef
### Title: Extract test results from the results of a concordance.test
### Aliases: coef coef,ConcordanceTest-method

### ** Examples


matRandom <- matrix(rnorm(3*20),20,3)
testResult <- concordance.test(matRandom)
getPsi(testResult)
coef(testResult)




