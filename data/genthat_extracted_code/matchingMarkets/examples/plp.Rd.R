library(matchingMarkets)


### Name: plp
### Title: Partitioning Linear Programme for the stable roommates problem
### Aliases: plp
### Keywords: algorithms

### ** Examples

## Roommate problem with 10 players, transferable utility and random preferences:
plp(N=10)

## Roommate problem with 10 players, transferable utility and given preferences:
V <- matrix(rep(1:10, 10), 10, 10)
plp(V=V)



