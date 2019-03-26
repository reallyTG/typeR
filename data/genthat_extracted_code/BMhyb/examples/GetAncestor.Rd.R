library(BMhyb)


### Name: GetAncestor
### Title: Identify the ancestor
### Aliases: GetAncestor

### ** Examples

	library(ape)
	#simulate a tree of 3 taxa
 	phy<-rtree(3)
 	#plot the tree
 	plot(phy)
 	#descedant node
 	node<-1
 	#get the ancestor node, it will return 5.
 	GetAncestor(phy,node)
 	


