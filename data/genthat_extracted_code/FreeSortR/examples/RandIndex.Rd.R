library(FreeSortR)


### Name: RandIndex
### Title: Rand Index between partitions
### Aliases: RandIndex

### ** Examples

  Partition1<-c(1,1,1,2,2,2)
  Partition2<-c(1,1,2,2,2,3)
  r<-RandIndex(Partition1,Partition2)
  r
  # $Rand
  # [1] 0.6
  # $AdjustedRand
  # [1] 0.1176471



