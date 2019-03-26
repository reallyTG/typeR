library(FreeSortR)


### Name: FreeSortR-package
### Title: Analysis of free sorting data.
### Aliases: FreeSortR-package FreeSortR
### Keywords: package

### ** Examples

  data(AromaSort)
  Aroma<-SortingPartition(AromaSort)
  res<-ConsensusPartition(Aroma)
  DescriptionPartition(res$Consensus)
  resMds<-MdsSort(Aroma,ndim=3)
  plotMds(resMds)



