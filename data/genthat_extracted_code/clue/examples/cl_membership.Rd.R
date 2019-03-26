library(clue)


### Name: cl_membership
### Title: Memberships of Partitions
### Aliases: cl_membership as.cl_membership
### Keywords: cluster

### ** Examples

## Getting the memberships of a single soft partition.
d <- dist(USArrests)
hclust_methods <-
    c("ward", "single", "complete", "average", "mcquitty")
hclust_results <- lapply(hclust_methods, function(m) hclust(d, m))
names(hclust_results) <- hclust_methods 
## Now create an ensemble from the results.
hens <- cl_ensemble(list = hclust_results)
## And add the results of agnes and diana.
require("cluster")
hens <- c(hens, list(agnes = agnes(d), diana = diana(d)))
## Create a dissimilarity object from this.
d1 <- cl_dissimilarity(hens)
## And compute a soft partition.
party <- fanny(d1, 2)
round(cl_membership(party), 5)
## The "nearest" hard partition to this:
as.cl_hard_partition(party)
## (which has the same class ids as cl_class_ids(party)).

## Extracting the memberships from the elements of an ensemble of
## partitions.
pens <- cl_boot(USArrests, 30, 3)
pens
mems <- lapply(pens, cl_membership)
## And turning these raw memberships into an ensemble of partitions.
pens <- cl_ensemble(list = lapply(mems, as.cl_partition))
pens
pens[[length(pens)]]



