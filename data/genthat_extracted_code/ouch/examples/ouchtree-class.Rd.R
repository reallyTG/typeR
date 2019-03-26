library(ouch)


### Name: ouchtree
### Title: Phylogenetic tree object in 'ouch' format.
### Aliases: ouchtree ouchtree-class show,ouchtree-method show-ouchtree
###   plot,ouchtree-method plot-ouchtree print,ouchtree-method
###   print-ouchtree coerce,ouchtree,data.frame-method
### Keywords: models

### ** Examples

data(bimac)
tree <- with(bimac,ouchtree(nodes=node,ancestors=ancestor,times=time,labels=species))
plot(tree)
plot(tree,node.names=TRUE)
print(tree)



