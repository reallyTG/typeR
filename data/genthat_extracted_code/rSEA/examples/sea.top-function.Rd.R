library(rSEA)


### Name: Top feature-sets
### Title: Top feature-sets from SEA_chart
### Aliases: sea.top

### ** Examples

  #Generate a vector of pvalues
  set.seed(102)
  m <- 10
  pvalues <- c(runif(0.5*m,0,0.02), runif(0.5*m,0,1))

  # First create a hommel object:
  hom <- hommel(pvalues, simes = TRUE)

  # Estimate te proportion of active features in the set by:
  set <- 1:5
  tdphat(hom, set)



