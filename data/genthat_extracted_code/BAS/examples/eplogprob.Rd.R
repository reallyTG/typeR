library(BAS)


### Name: eplogprob
### Title: eplogprob - Compute approximate marginal inclusion probabilities
###   from pvalues
### Aliases: eplogprob
### Keywords: regression

### ** Examples


library(MASS)
data(UScrime)
UScrime[,-2] = log(UScrime[,-2])
eplogprob(lm(y ~ ., data=UScrime))





