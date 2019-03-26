library(clue)


### Name: n_of_objects
### Title: Number of Objects in a Partition or Hierarchy
### Aliases: n_of_objects
### Keywords: cluster

### ** Examples

data("Cassini")
pcl <- kmeans(Cassini$x, 3)
n_of_objects(pcl)
hcl <- hclust(dist(USArrests))
n_of_objects(hcl)



