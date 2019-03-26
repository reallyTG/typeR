library(matchingR)


### Name: toptrading.checkStability
### Title: Check if there are any pairs of agents who would rather swap
###   houses with each other rather than be with their own two current
###   respective partners.
### Aliases: toptrading.checkStability

### ** Examples

pref = matrix(c(2, 4, 3, 4,
                3, 3, 4, 2,
                4, 2, 2, 1,
                1, 1, 1, 3), byrow = TRUE, nrow = 4)
pref
results = toptrading(pref = pref)
results
toptrading.checkStability(pref = pref, matchings = results)



