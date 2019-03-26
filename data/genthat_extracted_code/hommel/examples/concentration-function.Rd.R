library(hommel)


### Name: Concentration set
### Title: Concentration set calculation
### Aliases: concentration

### ** Examples

  #Generate a vector of pvalues
  set.seed(102)
  m <- 10
  pvalues <- c(runif(0.5*m,0,0.02), runif(0.5*m,0,1))
  
  # First step: create a hommel object.
  # Use Simes'test (simes = TRUE) or Hommel's robust test (simes = FALSE)
  hom <- hommel(pvalues, simes = TRUE)

  # Find the concentration set bound
  threshold <- concentration(hom)
  
  # Find the concentration set itself
  set <- pvalues <= threshold
  sum(set)



