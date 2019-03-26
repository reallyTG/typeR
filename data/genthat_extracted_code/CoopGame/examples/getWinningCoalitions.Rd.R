library(CoopGame)


### Name: getWinningCoalitions
### Title: Compute winning coalitions in a simple game
### Aliases: getWinningCoalitions

### ** Examples

library(CoopGame)
getWinningCoalitions(v=c(0,0,0,1,0,1,1))

## No test: 
library(CoopGame)
v=weightedVotingGameVector(n=3,w=c(1,2,3),q=5)
getWinningCoalitions(v)
# Output:
#   V1 V2 V3 cVal
# 6  0  1  1    1
# 7  1  1  1    1
# => the coalition containing player 2 and 3 and 
#    the grand coalition are winning coalitions
## End(No test)




