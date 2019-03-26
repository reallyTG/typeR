library(gromovlab)


### Name: gromovdist
### Title: Gromov-Hausdorff-type distances of labelled metric spaces
### Aliases: gromovdist gromovdist,list-method gromovdist,phylo-method
###   gromovdist,multiPhylo-method gromovdist,dist-method
###   gromovdist,dissimilarity-method gromovdist,matrix-method
###   gromovdist,igraph-method gromovdist.list gromovdist.phylo
###   gromovdist.multiPhylo gromovdist.dist gromovdist.dissimilarity
###   gromovdist.matrix gromovdist.igraph gromovdist.default
### Keywords: Gromov-Hausdorff metric, dissimilarity, tree space, finite
###   labeled metriv space

### ** Examples
library("ape")
tr1<-rtree(n=10)
tr2<-rtree(n=10)
gromovdist(tr1,tr2,"l1")
gromovdist(tr1,tr2,"l2")
#thesame, but slower
gromovdist(d1=tr1,d2=tr2,type="lp",p=2)
gromovdist(tr1,tr2,"linf")



