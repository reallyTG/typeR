library(npExact)


### Name: npExact-package
### Title: Nonparametric hypothesis tests
### Aliases: npExact-package npExact

### ** Examples


## npMeanPaired
## test whether pain after the surgery is less than before the surgery
data(pain)
npMeanPaired(pain$before, pain$after, lower = 0, upper = 100)

## npMeanSingle
## test whether Americans gave more than 5 dollars in a round of
## the Ultimatum game
data(bargaining)
us_offers <- bargaining$US
npMeanSingle(us_offers, mu = 5, lower = 0, upper = 10, alternative =
"greater", ignoreNA = TRUE) ## no rejection

## npMeanUnpaired
## test whether countries with french origin score lower than
## countries with no french origin
data(french)
origin <- french$french.origin
rest <- french$rest.of.civil
npMeanUnpaired(origin, rest, alternative = "less", ignoreNA = TRUE)

## npStochin
npStochinUnpaired(origin, rest, ignoreNA = TRUE)

## npVarianceSingle
## see if the minority share holder shores have a variance greater
## than 0.05
data(mshscores)
scores <- unlist(mshscores)
npVarianceSingle(scores, lower = 0, upper = 1, v = 0.05, ignoreNA = TRUE)




