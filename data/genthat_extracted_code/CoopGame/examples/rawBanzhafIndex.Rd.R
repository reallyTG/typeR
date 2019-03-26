library(CoopGame)


### Name: rawBanzhafIndex
### Title: Compute raw Banzhaf Index
### Aliases: rawBanzhafIndex

### ** Examples

library(CoopGame)
rawBanzhafIndex(apexGameVector(n=3, apexPlayer=1))

## No test: 
v<- apexGameVector(n = 4,apexPlayer=3)
rawBanzhafIndex(v)
#[1] 2 2 6 2

#N=c(1,2,3), w=(50,49,1), q=51   
v=weightedVotingGameVector(n=3, w=c(50,49,1),q=51)
rawBanzhafIndex(v)
#[1] 3 1 1

v<-weightedVotingGameVector(n=3,w=c(50,30,20),q=c(67))
rawBanzhafIndex(v)
#[1] 3 1 1
## End(No test)




