library(maptree)


### Name: kgs
### Title: KGS Measure for Pruning Hierarchical Clusters
### Aliases: kgs
### Keywords: manip cluster

### ** Examples

  library (cluster)
  data (votes.repub)

  a <- agnes (votes.repub, method="ward")
  b <- kgs (a, a$diss, maxclust=20)
  plot (names (b), b, xlab="# clusters", ylab="penalty")



