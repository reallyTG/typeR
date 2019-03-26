library(CoopGame)


### Name: johnstonIndex
### Title: Compute Johnston index
### Aliases: johnstonIndex

### ** Examples

library(CoopGame)
johnstonIndex(c(0,0,0,1,0,0,1))

## No test: 
#player 1 has 3 votes
#player 2 has 2 votes
#player 3 has 1 vote
#majority for the decision is 4 (quota)

library(CoopGame)
#function call generating the game vector:
v <- weightedVotingGameVector(n = 3, w = c(3,2,1), q = 4)

johnstonIndex(v)
#[1] 0.6666667 0.1666667 0.1666667
## End(No test)




