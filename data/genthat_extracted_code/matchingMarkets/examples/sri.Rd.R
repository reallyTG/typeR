library(matchingMarkets)


### Name: sri
### Title: All stable matchings in the stable roommates problem with
###   incomplete lists
### Aliases: sri
### Keywords: algorithms

### ** Examples

## Roommate problem with 10 players, given preferences:
 prefs <- matrix(rep(1:10, 10), 10, 10)
 sri(prefs=prefs)

## Roommate problem with 10 players, random preferences:
 sri(nAgents=10, seed=1)

## Roommate problem with no equilibrium matching:
 sri(nAgents=10, seed=2)

## Roommate problem with 3 equilibria:
 sri(nAgents=10, seed=3)




