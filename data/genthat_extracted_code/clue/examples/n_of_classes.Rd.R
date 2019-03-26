library(clue)


### Name: n_of_classes
### Title: Classes in a Partition
### Aliases: n_of_classes cl_class_ids as.cl_class_ids
### Keywords: cluster

### ** Examples

data("Cassini")
party <- kmeans(Cassini$x, 3)
n_of_classes(party)
## A simple confusion matrix:
table(cl_class_ids(party), Cassini$classes)
## For an "oversize" membership matrix representation:
n_of_classes(cl_membership(party, 6))



