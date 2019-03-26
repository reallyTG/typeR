library(FreeSortR)


### Name: SortingMds-class
### Title: Class 'SortingMds'
### Aliases: SortingMds-class getConfig,SortingMds-method
###   getPercent,SortingMds-method getStress,SortingMds-method
###   show,SortingMds-method summary,SortingMds-method

### ** Examples

  data(AromaSort)
  Aroma<-SortingPartition(AromaSort)
  resMds<-MdsSort(Aroma,ndim=2,metric=FALSE)
  summary(resMds)



