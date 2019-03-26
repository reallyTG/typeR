library(qualCI)


### Name: quade
### Title: Calculate Quade's statistic and one-sided p-value.
### Aliases: quade
### Keywords: causal inference

### ** Examples

data(pluralityPairs)
between.ranks <- c(3,4,2,1)
dat <- quade.prep(data=pluralityPairs, set="pair", treatment="plurality", 
withinRank="OppHarRank", unit="country", betweenRank=between.ranks)
qout <- quade(dat)
qout

data(pluralitySets)
between.ranks <- c(2,3,1)
dat <- quade.prep(data=pluralitySets, set="set", treatment="plurality", 
withinRank="OppHarRank", unit="country", betweenRank=between.ranks)
qout <- quade(dat)
qout
head(qout$permutations)



