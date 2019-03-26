library(clue)


### Name: cl_consensus
### Title: Consensus Partitions and Hierarchies
### Aliases: cl_consensus
### Keywords: cluster

### ** Examples

## Consensus partition for the Rosenberg-Kim kinship terms partition
## data based on co-membership dissimilarities.
data("Kinship82")
m1 <- cl_consensus(Kinship82, method = "GV3",
                   control = list(k = 3, verbose = TRUE))
## (Note that one should really use several replicates of this.)
## Value for criterion function to be minimized:
sum(cl_dissimilarity(Kinship82, m1, "comem") ^ 2)
## Compare to the consensus solution given in Gordon & Vichi (2001).
data("Kinship82_Consensus")
m2 <- Kinship82_Consensus[["JMF"]]
sum(cl_dissimilarity(Kinship82, m2, "comem") ^ 2)
## Seems we get a better solution ...
## How dissimilar are these solutions?
cl_dissimilarity(m1, m2, "comem")
## How "fuzzy" are they?
cl_fuzziness(cl_ensemble(m1, m2))
## Do the "nearest" hard partitions fully agree?
cl_dissimilarity(as.cl_hard_partition(m1),
                 as.cl_hard_partition(m2))

## Consensus partition for the Gordon and Vichi (2001) macroeconomic
## partition data based on Euclidean dissimilarities.
data("GVME")
set.seed(1)
## First, using k = 2 classes.
m1 <- cl_consensus(GVME, method = "GV1",
                   control = list(k = 2, verbose = TRUE))
## (Note that one should really use several replicates of this.)
## Value of criterion function to be minimized:
sum(cl_dissimilarity(GVME, m1, "GV1") ^ 2)
## Compare to the consensus solution given in Gordon & Vichi (2001).
data("GVME_Consensus")
m2 <- GVME_Consensus[["MF1/2"]]
sum(cl_dissimilarity(GVME, m2, "GV1") ^ 2)
## Seems we get a slightly  better solution ...
## But note that
cl_dissimilarity(m1, m2, "GV1")
## and that the maximal deviation of the memberships is
max(abs(cl_membership(m1) - cl_membership(m2)))
## so the differences seem to be due to rounding.
## Do the "nearest" hard partitions fully agree?
table(cl_class_ids(m1), cl_class_ids(m2))

## And now for k = 3 classes.
m1 <- cl_consensus(GVME, method = "GV1",
                   control = list(k = 3, verbose = TRUE))
sum(cl_dissimilarity(GVME, m1, "GV1") ^ 2)
## Compare to the consensus solution given in Gordon & Vichi (2001).
m2 <- GVME_Consensus[["MF1/3"]]
sum(cl_dissimilarity(GVME, m2, "GV1") ^ 2)
## This time we look much better ...
## How dissimilar are these solutions?
cl_dissimilarity(m1, m2, "GV1")
## Do the "nearest" hard partitions fully agree?
table(cl_class_ids(m1), cl_class_ids(m2))



