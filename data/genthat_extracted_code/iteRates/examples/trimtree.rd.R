library(iteRates)


### Name: trimTree
### Title: trimTree
### Aliases: trimTree

### ** Examples

	## Not run: 
##D data(hivtree.newick)
##D cat(hivtree.newick, file = "hivtree.phy", sep = "\n") 
##D tree.hiv <- read.tree("hivtree.phy") # load tree 
##D unlink("hivtree.phy") # delete the file "hivtree.phy" 
##D 
##D trim.hiv<-trimTree(phy=tree.hiv,Time=0.1)#trims 0.1 branchlength units from the tree
##D par(mfrow=c(1,2))
##D plot.phylo(trim.hiv$o.tree);plot.phylo(trim.hiv$t.tree)
##D 
##D # Identify the names of the original terminal taxa 
##D # that correspond to the newly defined, numbered tips.
##D trim.hiv$t.tree$new.tip.clades
## End(Not run)



