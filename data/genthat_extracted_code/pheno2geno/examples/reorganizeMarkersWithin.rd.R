library(pheno2geno)


### Name: reorganizeMarkersWithin
### Title: Reorganize markers within cross object.
### Aliases: reorganizeMarkersWithin
### Keywords: manip

### ** Examples

  data(testCross)
  data(testPopulation)
  assignment <- cross.denovo(testPopulation,n.chr=5,verbose=TRUE,map="genetic",
  comparisonMethod=sumMajorityCorrelation, use.orderMarkers=FALSE,reOrder=FALSE)
  assignment #boring,but expected
  ordering <- assignChrToMarkers(assignment,testCross)
  testCross <- reorganizeMarkersWithin(testCross, ordering)




