library(iteRates)


### Name: id.subtrees
### Title: id.subtrees
### Aliases: id.subtrees
### Keywords: ~kwd1 ~kwd2

### ** Examples

	## Not run: 
##D data(hivtree.newick)
##D cat(hivtree.newick, file = "hivtree.phy", sep = "\n") 
##D tree.hiv <- read.tree("hivtree.phy") # load tree 
##D unlink("hivtree.phy") # delete the file "hivtree.phy" 
##D 
##D idHIV<-id.subtrees(tree.hiv)
##D plot(idHIV$tree,show.node.label=TRUE)
## End(Not run)


