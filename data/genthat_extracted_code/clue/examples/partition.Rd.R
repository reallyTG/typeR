library(clue)


### Name: partition
### Title: Partitions
### Aliases: cl_partition is.cl_partition is.cl_hard_partition
###   is.cl_soft_partition cl_hard_partition as.cl_partition
###   as.cl_hard_partition
### Keywords: cluster

### ** Examples

data("Cassini")
pcl <- kmeans(Cassini$x, 3)
is.cl_partition(pcl)
is.cl_hard_partition(pcl)
is.cl_soft_partition(pcl)



