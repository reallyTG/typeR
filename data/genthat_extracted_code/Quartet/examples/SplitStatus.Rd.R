library(Quartet)


### Name: SplitStatus
### Title: Matching partitions
### Aliases: SplitStatus BipartitionStatus SharedSplitStatus
###   SharedBipartitionStatus

### ** Examples

{
  data('sq_trees')
  
  # Calculate the status of each quartet
  splitStatuses <- SplitStatus(sq_trees)
  
  # Calculate the Robinson Foulds distances
  RobinsonFoulds(splitStatuses)
  
  # Normalize the Robinson Foulds distance by dividing by the number of 
  # splits (bipartitions) present in the two trees:
  RobinsonFoulds(splitStatuses) / splitStatuses[, 'N']
  
  # Normalize the Robinson Foulds distance by dividing by the total number of 
  # splits (bipartitions) that it is possible to resolve for `n` tips:
  nTip <- length(sq_trees[[1]]$tip.label)
  nPartitions <- 2 * (nTip - 3L) # Does not include the nTip partitions that 
                                 # comprise but a single tip
  RobinsonFoulds(splitStatuses) / nPartitions
  
}




