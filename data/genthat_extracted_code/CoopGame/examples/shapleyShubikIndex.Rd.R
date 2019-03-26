library(CoopGame)


### Name: shapleyShubikIndex
### Title: Compute Shapley-Shubik index
### Aliases: shapleyShubikIndex

### ** Examples

library(CoopGame)
shapleyShubikIndex(v=c(0,0,0,0,1,0,1))

## No test: 
#Example from Stach (2011):
library(CoopGame)
v=weightedVotingGameVector(n=4,q=50,w=c(10,10,20,30))
shapleyShubikIndex(v)
#[1] 0.08333333 0.08333333 0.25000000 0.58333333
## End(No test)




