library(CoopGame)


### Name: weightedVotingGame
### Title: Construct a weighted voting game
### Aliases: weightedVotingGame quotaGame

### ** Examples

library(CoopGame)
weightedVotingGame(n=3,w=c(1,2,3),q=4)

## No test: 
library(CoopGame)
weightedVotingGame(n=4,w=c(1,2,3,4),q=5)

#Output:
#$n
#[1] 4

#$w
#[1] 1 2 3 4
#
#$q
#[1] 5
#
#$v
#[1] 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1
## End(No test)




