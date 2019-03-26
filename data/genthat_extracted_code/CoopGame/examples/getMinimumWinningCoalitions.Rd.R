library(CoopGame)


### Name: getMinimumWinningCoalitions
### Title: Compute minimal winning coalitions in a simple game
### Aliases: getMinimumWinningCoalitions getMinimalWinningCoalitions

### ** Examples

library(CoopGame)
getMinimumWinningCoalitions(v=c(0,0,0,0,0,0,1))

## No test: 
library(CoopGame)
v=weightedVotingGameVector(n=3,w=c(1,2,3),q=5)
getMinimumWinningCoalitions(v)
# Output:
#   V1 V2 V3 cVal
# 6  0  1  1    1
# => the coalition containing player 2 and 3 is a minimal winning coalition
## End(No test)




