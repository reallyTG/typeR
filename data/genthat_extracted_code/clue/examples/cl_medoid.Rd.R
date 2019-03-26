library(clue)


### Name: cl_medoid
### Title: Medoid Partitions and Hierarchies
### Aliases: cl_medoid
### Keywords: cluster

### ** Examples

## An ensemble of partitions.
data("CKME")
pens <- CKME[1 : 20]
m1 <- cl_medoid(pens)
diss <- cl_dissimilarity(pens)
require("cluster")
m2 <- pens[[pam(diss, 1)$medoids]]
## Agreement of medoid consensus partitions.
cl_agreement(m1, m2)
## Or, more straightforwardly:
table(cl_class_ids(m1), cl_class_ids(m2))



