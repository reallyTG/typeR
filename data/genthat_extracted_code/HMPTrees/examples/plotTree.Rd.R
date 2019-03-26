library(HMPTrees)


### Name: plotTree
### Title: Plots a Tree Object
### Aliases: plotTree

### ** Examples

	data(saliva)
	
	### Creates a tree for the 4th sample in 'Saliva' then plots it
	salivaTree <- createTrees(saliva[,4, drop=FALSE])
	plotTree(salivaTree, displayLegend=FALSE)



