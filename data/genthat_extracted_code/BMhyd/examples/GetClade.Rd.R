library(BMhyd)


### Name: GetClade
### Title: Get clade from the tree
### Aliases: GetClade

### ** Examples

	library(ape)
	library(phytools)
	#simulate a tree 
 	phy<-rtree(3)
 	#plot the tree
 	plot(phy) 
 	#set up the clade size
 	clade.size<-2
 	#search the nodes that has desired clade size
 	GetClade(phy,clade.size) #node 5 will be return
 	


