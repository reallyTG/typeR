library(BAS)


### Name: eplogprob.marg
### Title: eplogprob.marg - Compute approximate marginal inclusion
###   probabilities from pvalues
### Aliases: eplogprob.marg
### Keywords: regression

### ** Examples


library(MASS)
data(UScrime)
UScrime[,-2] = log(UScrime[,-2])
eplogprob(lm(y ~ ., data=UScrime))



