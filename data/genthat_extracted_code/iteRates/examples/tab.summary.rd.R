library(iteRates)


### Name: tab.summary
### Title: tab.summary
### Aliases: tab.summary
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
##D cfsHIV<-comp.fit.subs(idHIV$subtree,focal=c(153,119,96,5),k=4)
##D tab.summary(cfsHIV)
##D tab.summary(cfsHIV,daic=1)
##D tab.summary(cfsHIV,daic=0.01)
## End(Not run)



