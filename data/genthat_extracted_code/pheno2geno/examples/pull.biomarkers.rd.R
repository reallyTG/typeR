library(pheno2geno)


### Name: pull.biomarkers
### Title: Extract the detected biomarkers from a population object.
### Aliases: pull.biomarkers
### Keywords: manip

### ** Examples

  data(testPopulation)
  markers <- pull.biomarkers(testPopulation,verbose=TRUE)
  bestMarker <- pull.biomarkers(testPopulation,round(runif(148)),verbose=TRUE)



