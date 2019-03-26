library(recluster)


### Name: recluster.expl.diss
### Title: Cut a phylogenetic tree to a given series of nodes and computes
###   explained dissimilarity.
### Aliases: recluster.expl.diss
### Keywords: cluster

### ** Examples

data(datamod)
sor_tree<- recluster.cons(datamod, dist="sorensen")
sor_diss <- recluster.dist (datamod, dist="sorensen")
expl_diss <- recluster.expl.diss (sor_tree$cons,sor_diss)
expl_diss 



