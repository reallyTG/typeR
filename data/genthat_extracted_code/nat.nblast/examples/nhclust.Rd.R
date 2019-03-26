library(nat.nblast)


### Name: nhclust
### Title: Cluster a set of neurons
### Aliases: nhclust

### ** Examples

library(nat)
kcscores=nblast_allbyall(kcs20)
hckcs=nhclust(scoremat=kcscores)
# divide hclust object into 3 groups
library(dendroextras)
dkcs=colour_clusters(hckcs, k=3)
# change dendrogram labels to neuron type, extracting this information
# from type column in the metadata data.frame attached to kcs20 neuronlist
labels(dkcs)=with(kcs20[labels(dkcs)], type)
plot(dkcs)
# 3d plot of neurons in those clusters (with matching colours)
open3d()
plot3d(hckcs, k=3, db=kcs20)
# names of neurons in 3 groups
subset(hckcs, k=3)



