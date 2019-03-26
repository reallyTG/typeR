library(hommel)


### Name: hommel class
### Title: Class "hommel" for storing the result of Hommel's multiple
###   testing method.
### Aliases: hommel-class p.adjust,hommel-method summary,hommel-method
###   show,hommel-method
### Keywords: methods

### ** Examples

  #Generate a vector of pvalues
  set.seed(102)
  m <- 10
  pvalues <- c(runif(0.5*m,0,0.02), runif(0.5*m,0,1))
  
  # First step: create a hommel object.
  # Use Simes'test (simes = TRUE) or Hommel's robust test (simes = FALSE)
  hom <- hommel(pvalues, simes = TRUE)

  hom
  summary(hom)
  
  # retrieve familywise error adjusted p-values
  p.adjust(hom)
  
  # Find lower confidence bounds 
  # for the number of false null hypotheses (discoveries)
  # In any subset of interest
  discoveries(hom, 1:2)



