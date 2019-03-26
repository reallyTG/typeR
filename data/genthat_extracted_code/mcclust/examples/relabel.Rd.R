library(mcclust)


### Name: relabel
### Title: Stephens' Relabelling Algorithm for Clusterings
### Aliases: relabel
### Keywords: cluster

### ** Examples

(cls <- rbind(c(1,1,2,2),c(1,1,2,2),c(1,2,2,2),c(2,2,1,1)))
# group 2 in clustering 4 corresponds to group 1 in clustering 1-3.
cls.relab <- relabel(cls)
cls.relab$cls



