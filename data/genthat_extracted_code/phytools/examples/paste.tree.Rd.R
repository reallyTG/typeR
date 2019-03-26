library(phytools)


### Name: paste.tree
### Title: Paste two trees together
### Aliases: paste.tree
### Keywords: phylogenetics utilities

### ** Examples

tr1<-rtree(10)
tr2<-rtree(10)
tr1$tip.label[1]<-"NA"
tr2$root.edge<-0
tr3<-paste.tree(tr1,tr2)



