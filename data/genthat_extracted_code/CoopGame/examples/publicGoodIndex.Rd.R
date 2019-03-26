library(CoopGame)


### Name: publicGoodIndex
### Title: Compute Public Good index
### Aliases: publicGoodIndex hollerIndex

### ** Examples

library(CoopGame)
publicGoodIndex(v=c(0,0,0,1,1,0,1))

## No test: 
#Example from Holler (2011) illustrating paradox of weighted voting
library(CoopGame)
v=weightedVotingGameVector(n=5,w=c(35,20,15,15,15), q=51)
publicGoodIndex(v) 
#[1] 0.2666667 0.1333333 0.2000000 0.2000000 0.2000000
## End(No test)




