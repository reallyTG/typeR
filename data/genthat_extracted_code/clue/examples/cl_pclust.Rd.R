library(clue)


### Name: cl_pclust
### Title: Prototype-Based Partitions of Clusterings
### Aliases: cl_pclust
### Keywords: cluster

### ** Examples

## Use a precomputed ensemble of 50 k-means partitions of the
## Cassini data.
data("CKME")
CKME <- CKME[1 : 30]		# for saving precious time ...
diss <- cl_dissimilarity(CKME)
hc <- hclust(diss)
plot(hc)
## This suggests using a partition with three classes, which can be
## obtained using cutree(hc, 3).  Could use cl_consensus() to compute
## prototypes as the least squares consensus clusterings of the classes,
## or alternatively:
set.seed(123)
x1 <- cl_pclust(CKME, 3, m = 1)
x2 <- cl_pclust(CKME, 3, m = 2)
## Agreement of solutions.
cl_dissimilarity(x1, x2)
table(cl_class_ids(x1), cl_class_ids(x2))



