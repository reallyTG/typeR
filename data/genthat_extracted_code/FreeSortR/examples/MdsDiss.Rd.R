library(FreeSortR)


### Name: MdsDiss
### Title: Mds of a dissimilarity matrix
### Aliases: MdsDiss

### ** Examples

  data(AromaSort)
  Aroma<-SortingPartition(AromaSort)
  ListDissimil<-Dissimil(Aroma)
  MatDissim<-apply(simplify2array(ListDissimil),c(1,2),'sum')
  Mdsres<-MdsDiss(MatDissim)



