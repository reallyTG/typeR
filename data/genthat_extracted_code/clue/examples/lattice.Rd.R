library(clue)


### Name: lattice
### Title: Cluster Lattices
### Aliases: cl_meet cl_join Ops.cl_partition Summary.cl_partition
###   Ops.cl_dendrogram Ops.cl_hierarchy Summary.cl_hierarchy
### Keywords: cluster

### ** Examples

## Two simple partitions of 7 objects.
A <- as.cl_partition(c(1, 1, 2, 3, 3, 5, 5))
B <- as.cl_partition(c(1, 2, 2, 3, 4, 5, 5))
## These disagree on objects 1-3, A splits objects 4 and 5 into
## separate classes.  Objects 6 and 7 are always in the same class.
(A <= B) || (B <= A)
## (Neither partition is finer than the other.)
cl_meet(A, B)
cl_join(A, B)
## Meeting with the lumper (greatest) or joining with the splitter
## (least) partition does not make a difference: 
C_lumper <- as.cl_partition(rep(1, n_of_objects(A)))
cl_meet(cl_ensemble(A, B, C_lumper))
C_splitter <- as.cl_partition(seq(length = n_of_objects(A)))
cl_join(cl_ensemble(A, B, C_splitter))
## Another way of computing the join:
range(A, B, C_splitter)$max



