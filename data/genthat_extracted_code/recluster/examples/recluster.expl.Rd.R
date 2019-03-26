library(recluster)


### Name: recluster.expl
### Title: Compute the dissimilarity contained in a distance matrix which
###   is explained by a clustering solution of the elements.
### Aliases: recluster.expl
### Keywords: cluster

### ** Examples

data(datamod)
sor_tree<- recluster.cons(datamod, dist="sorensen")
sor_diss <- recluster.dist (datamod, dist="sorensen")
expl_diss <- recluster.expl.diss (sor_tree$cons,sor_diss)
expl_diss 



