library(hommel)


### Name: Local test
### Title: P-values and adjusted p-values of local tests
### Aliases: localtest

### ** Examples

  #Generate a vector of pvalues
  set.seed(102)
  m <- 10
  pvalues <- c(runif(0.5*m,0,0.02), runif(0.5*m,0,1))

  # First step: create a hommel object.
  hom <- hommel(pvalues, simes = TRUE)

  # Test any intersection hypothesis of interest against any chosen threshold
  localtest(hom, tdp=0.2)
  localtest(hom, 1:3, 0.8)



