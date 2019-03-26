library(cherry)


### Name: Construct the DAG from a given collection of sets.
### Title: Constructing a DAG.
### Aliases: construct

### ** Examples

  
  #Generate data, where the response Y is associated with two (out of 4) covariates
  set.seed(1)
  n=100
  p=4
  X <- matrix(rnorm(n*p),n,p)
  beta <- c(0,0.5,0.5,0)
  Y <- X %*% beta + rnorm(n)
  
  # Let us assume we have the following sets that we want to test: 
  sets <- list(c(1,2,3,4), c(1,2), c(2,3,4), c(2,3), 1, 2, 3, 4)
  names(sets) <- c(1234, 12, 234, 23, 1, 2, 3, 4)
  
  # Start by making the corresponding graph structure
  struct <- construct(sets)
  
  # Check whether the DAG has toway logical relations: 
  istwoway(struct)




