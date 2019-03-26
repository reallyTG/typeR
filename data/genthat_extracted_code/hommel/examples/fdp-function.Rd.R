library(hommel)


### Name: True Discoveries
### Title: Confidence bounds for the number of discoveries
### Aliases: discoveries fdp tdp

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
  
  # Find lower confidence bounds 
  # for the number of false null hypotheses (discoveries)
  # In any subset of interest
  discoveries(hom, 1:2)
  
  # a bound for the false discovery proportion:
  set <- 1:5
  fdp(hom, set)
  
  # use alpha=0.5 to obtain a conservative point estimate
  tdp(hom, set, alpha=0.5)



