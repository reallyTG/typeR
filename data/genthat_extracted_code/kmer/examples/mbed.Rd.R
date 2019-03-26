library(kmer)


### Name: mbed
### Title: Convert sequences to vectors of distances to a subset of seed
###   sequences.
### Aliases: mbed

### ** Examples

  ## compute an embedded k-mer distance matrix for the woodmouse
  ## dataset (ape package) using a k-mer size of 5
  library(ape)
  data(woodmouse)
  ## randomly select three sequences as seeds
  set.seed(999)
  seeds <- sample(1:15, size = 3)
  ## embed the woodmouse dataset in three dimensions
  woodmouse.mbed <- mbed(woodmouse, seeds = seeds, k = 5)
  ## print the distance matrix (without attributes)
  print(woodmouse.mbed[,], digits = 2)



