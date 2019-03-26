library(FreeSortR)


### Name: ConsensusPartition
### Title: Consensus of Partitions
### Aliases: ConsensusPartition

### ** Examples

  data(AromaSort)
  Aroma<-SortingPartition(AromaSort)
  res<-ConsensusPartition(Aroma,ngroups=0,type="cutree")
  res
  ##res<-ConsensusPartition(Aroma,ngroups=0,type="fusion",optim=TRUE)
  ##res
  ##res<-ConsensusPartition(Aroma,type="medoid")
  ##res
  



