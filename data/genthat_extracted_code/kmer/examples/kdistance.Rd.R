library(kmer)


### Name: kdistance
### Title: K-mer distance matrix computation.
### Aliases: kdistance

### ** Examples

  ## compute a k-mer distance matrix for the woodmouse
  ## dataset (ape package) using a k-mer size of 5
  library(ape)
  data(woodmouse)
  ### subset global alignment by removing gappy ends
  woodmouse <- woodmouse[, apply(woodmouse, 2, function(v) !any(v == 0xf0))]
  ### compute the distance matrix
  woodmouse.dist <- kdistance(woodmouse, k = 5)
  ### cluster and plot UPGMA tree
  woodmouse.tree <- as.dendrogram(hclust(woodmouse.dist, "average"))
  plot(woodmouse.tree)



