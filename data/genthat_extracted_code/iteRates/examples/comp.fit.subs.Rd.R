library(iteRates)


### Name: comp.fit.subs
### Title: comp.fit.subs
### Aliases: comp.fit.subs
### Keywords: ~kwd1 ~kwd2

### ** Examples

data(hivtree.newick)
cat(hivtree.newick, file = "hivtree.phy", sep = "\n") 
tree.hiv <- read.tree("hivtree.phy") # load tree 
unlink("hivtree.phy") # delete the file "hivtree.phy" 

idHIV<-id.subtrees(tree.hiv)
plot(idHIV$tree,show.node.label=TRUE)
cfsHIV<-comp.fit.subs(idHIV$subtree,focal=c(153,119,96,5),k=4)





