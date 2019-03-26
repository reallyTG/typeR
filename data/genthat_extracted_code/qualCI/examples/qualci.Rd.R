library(qualCI)


### Name: qualCI
### Title: Calculate qualitative confidence intervals.
### Aliases: qualCI
### Keywords: causal inference

### ** Examples

data(pluralityPairs)
between.ranks <- c(3,4,2,1)
dat <- quade.prep(data=pluralityPairs, set="pair", treatment="plurality", 
withinRank="OppHarRank", unit="country", betweenRank=between.ranks)
qout <- quade(dat)
qualCI(qout)


data(pluralitySets)
between.ranks <- c(2,3,1)
dat <- quade.prep(data=pluralitySets, set="set", treatment="plurality", 
withinRank="OppHarRank", unit="country", betweenRank=between.ranks)
qout <- quade(dat)
# not run because requires user input
# qualCI(qout)




