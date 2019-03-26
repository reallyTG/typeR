library(CoopGame)


### Name: nonNormalizedBanzhafIndex
### Title: Compute non-normalized Banzhaf index
### Aliases: nonNormalizedBanzhafIndex

### ** Examples

library(CoopGame)
nonNormalizedBanzhafIndex(dictatorGameVector(n=3, dictator=1))

## No test: 
library(CoopGame)
v<-weightedVotingGameVector(n=4,w=c(8,6,4,2),q=c(12))
nonNormalizedBanzhafIndex(v)
#[1] 0.625 0.375 0.375 0.125

library(CoopGame)
v<- apexGameVector(n = 4,apexPlayer=3)
nonNormalizedBanzhafIndex(v)
#[1] 0.25 0.25 0.75 0.25

library(CoopGame)
#N=c(1,2,3), w=(50,49,1), q=51   
v=weightedVotingGameVector(n=3, w=c(50,49,1),q=51)
nonNormalizedBanzhafIndex(v)
#[1] 0.75 0.25 0.25

library(CoopGame) 
v<-weightedVotingGameVector(n=3,w=c(50,30,20),q=c(67))
nonNormalizedBanzhafIndex(v)
#[1] 0.75 0.25 0.25
## End(No test)




