library(CoopGame)


### Name: deeganPackelIndex
### Title: Compute Deegan-Packel index
### Aliases: deeganPackelIndex

### ** Examples

library(CoopGame)
deeganPackelIndex(c(0,0,0,0,1,0,1))

## No test: 
#Example from HOLLER & ILLING (2006), chapter 6.3.3
#Expected result: dpv=(18/60,9/60,11/60,11/60,11/60)
library(CoopGame)
v1=weightedVotingGameVector(n = 5, w=c(35,20,15,15,15), q=51)
deeganPackelIndex(v1)
#Output (as expected, see HOLLER & ILLING chapter 6.3.3) :
#[1] 0.3000000 0.1500000 0.1833333 0.1833333 0.1833333
## End(No test)




