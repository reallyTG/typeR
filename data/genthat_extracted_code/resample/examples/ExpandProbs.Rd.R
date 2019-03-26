library(resample)


### Name: ExpandProbs
### Title: Calculate modified probabilities for more accurate confidence
###   intervals
### Aliases: ExpandProbs
### Keywords: nonparametric htest

### ** Examples

probs <- c(0.025, 0.975)
n <- c(5, 10, 20, 40, 100, 200, 1000)
outer(probs, n, ExpandProbs)



