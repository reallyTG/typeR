library(PCPS)


### Name: define.clade
### Title: Define clade
### Aliases: define.clade
### Keywords: PCPS

### ** Examples


require(ape)	
tree<-makeNodeLabel(rcoal(10))
clades<-define.clade(tree, threshold = 0.8, method = "threshold")
clades
plot.phylo(tree, show.node.label = TRUE)
abline(v = clades$height)



