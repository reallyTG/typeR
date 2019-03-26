library(cherry)


### Name: DAGstructure class
### Title: Class "DAGstructure" for storing the result of the construct
###   method that constructs the DAG.
### Aliases: DAGstructure DAGstructure-class istwoway
###   istwoway,DAGstructure-method
### Keywords: methods

### ** Examples

  
  # Let us assume we have the following sets that we want to test: 
  sets <- list(c(1,2,3,4), c(1,2), c(2,3,4), c(2,3), 1, 2, 3, 4)
  # The sets need to have names in order to be able to look up their p-values later
  names(sets) <- c(1234, 12, 234, 23, 1, 2, 3, 4)
  
  # Start by making the corresponding graph structure
  struct <- construct(sets)
  
  # Check whether the DAG has toway logical relations: 
  istwoway(struct)
  



