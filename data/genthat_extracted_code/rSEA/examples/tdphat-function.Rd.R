library(rSEA)


### Name: TDP point estimate
### Title: TDP point estimate
### Aliases: tdphat

### ** Examples

  #Generate a vector of pvalues
  set.seed(102)
  m <- 10
  pvalues <- c(runif(0.5*m,0,0.02), runif(0.5*m,0,1))

  # First step: create a hommel object.
  hom <- hommel(pvalues, simes = TRUE)

  # Get the median point estimate for the feature-set of interest:
  set <- 1:5
  tdphat(hom, set)



