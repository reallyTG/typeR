library(rSEA)


### Name: Simultaneous Testing of Many Feature-sets
### Title: Simultaneous Testing of Many Feature-sets
### Aliases: sea.test

### ** Examples

  #Generate a vector of pvalues
  set.seed(102)
  m <- 10
  pvalues <- c(runif(0.5*m,0,0.02), runif(0.5*m,0,1))

  # First step: create a hommel object.
  hom<-hommel(pvalues)
  # Use Unified null to test the proportion of true discoveries against 0
  set.test (hom, 1:3, "selfcontained")




