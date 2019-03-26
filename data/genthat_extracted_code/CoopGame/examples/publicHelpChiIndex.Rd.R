library(CoopGame)


### Name: publicHelpChiIndex
### Title: Compute Public Help index Chi
### Aliases: publicHelpChiIndex publicHelpIndexChi

### ** Examples

library(CoopGame)
publicHelpChiIndex(v=c(0,0,0,0,1,0,1))

## No test: 
#Example from original paper by Stach (2016), p. 105:
library(CoopGame)
v=c(0,0,0,1,1,0,1)
publicHelpChiIndex(v) 
#result: 0.4583333 0.2708333 0.2708333

#Second example from original paper by Stach (2016), p. 105:
library(CoopGame)
v=c(0,0,0,0,1,1,0,0,0,0,1,1,1,0,1)
publicHelpChiIndex(v)
#result: 0.3981481 0.2376543 0.2376543 0.1265432
## End(No test)




