library(SyNet)


### Name: partitionindex
### Title: Partition Index of a Sympatry Network
### Aliases: partitionindex
### Keywords: aplot methods

### ** Examples

  #Creates a Bernoulli graph of 100 nodes
  A <- matrix(0, 100, 100)
  aux <- ifelse(runif(choose(100, 2)) <= 0.3, 1, 0)
  A[row(A) > col(A)] <- aux
  A + t(A) -> A
  #Prints the partition index on the R console
  partitionindex(A)
  #Produces 10 random samples and test significancy 
  partitionindex(A, 100)



