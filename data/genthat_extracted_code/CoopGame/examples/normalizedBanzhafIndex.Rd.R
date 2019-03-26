library(CoopGame)


### Name: normalizedBanzhafIndex
### Title: Compute normalized Banzhaf index
### Aliases: normalizedBanzhafIndex

### ** Examples

library(CoopGame)
normalizedBanzhafIndex(dictatorGameVector(n=3, dictator=1))

## No test: 
library(CoopGame)
v<-weightedVotingGameVector(n=4,w=c(8,6,4,2),q=c(12))
normalizedBanzhafIndex(v)
#[1] 0.41666667 0.25000000 0.25000000 0.08333333

library(CoopGame) 
v<- apexGameVector(n = 4,apexPlayer=3)
normalizedBanzhafIndex(v)
#[1] 0.1666667 0.1666667 0.5000000 0.1666667

library(CoopGame)
#N=c(1,2,3), w=(50,49,1), q=51   
v=weightedVotingGameVector(n=3, w=c(50,49,1),q=51)
normalizedBanzhafIndex(v)
#[1] 0.6 0.2 0.2

library(CoopGame)
v<-weightedVotingGameVector(n=3,w=c(50,30,20),q=c(67))
normalizedBanzhafIndex(v)
#[1] 0.6 0.2 0.2
## End(No test)




