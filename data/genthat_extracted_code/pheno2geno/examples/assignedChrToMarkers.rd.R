library(pheno2geno)


### Name: assignChrToMarkers
### Title: Function that assigns a chromosome label to a genetic marker
### Aliases: assignChrToMarkers
### Keywords: manip

### ** Examples

	data(testCross)
	data(testPopulation)
	assignment <- cross.denovo(testPopulation,n.chr=5,verbose=TRUE,map="genetic",
  comparisonMethod=sumMajorityCorrelation, use.orderMarkers=FALSE,reOrder=FALSE)
  assignment
  ordering <- assignChrToMarkers(assignment,testCross)



