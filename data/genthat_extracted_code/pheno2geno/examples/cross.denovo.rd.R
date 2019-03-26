library(pheno2geno)


### Name: cross.denovo
### Title: Create a de novo genetic map from a population object.
### Aliases: cross.denovo assignMaximum assignMaximumNoConflicts
###   majorityCorrelation majorityOfMarkers meanCorrelation
###   sumMajorityCorrelation
### Keywords: manip

### ** Examples

	data(testPopulation)
	cross <- cross.denovo(testPopulation,n.chr=5,verbose=TRUE,map="genetic",
  comparisonMethod=sumMajorityCorrelation, use.orderMarkers=FALSE)



