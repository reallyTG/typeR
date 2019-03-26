library(ndl)


### Name: plurals
### Title: Artificial data set used to illustrate the Rescorla-Wagner
###   equations and naive discriminative learning.
### Aliases: plurals
### Keywords: datasets

### ** Examples

data(plurals)
plurals$Cues <- orthoCoding(plurals$WordForm, grams=1)
estimateWeights(cuesOutcomes=plurals)



