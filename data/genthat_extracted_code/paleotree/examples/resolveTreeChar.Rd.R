library(paleotree)


### Name: resolveTreeChar
### Title: Resolve Polytomies Using Parsimony-Based Reconstruction of a
###   Discrete Character
### Aliases: resolveTreeChar

### ** Examples


## No test: 

# let's write a quick&dirty ancestral trait plotting function

quickAncPlot <- function(tree, trait, cex, orderedChar = FALSE, type = "MPR", cost = NULL){
	 ancData <- ancPropStateMat(tree = tree, trait = trait, orderedChar = orderedChar)
	 ancCol <- (1:ncol(ancData))+1
 	plot(tree,show.tip.label = FALSE,no.margin = TRUE,direction = "upwards")
 	tiplabels(pch = 16,pie = ancData[(1:Ntip(tree)),],cex = cex,piecol = ancCol,
		col = 0)
 	nodelabels(pie = ancData[-(1:Ntip(tree)),],cex = cex,piecol = ancCol)	
 	}

##########

# examples with simulated data

set.seed(2)
tree <- rtree(50)
#simulate under a likelihood model
trait <- rTraitDisc(tree,k = 3,rate = 0.7)
tree <- degradeTree(tree,prop_collapse = 0.6)
tree <- ladderize(tree,right = FALSE)

#a bunch of type = MPR (default) examples
treeUnord <- resolveTreeChar(tree,trait,orderedChar = FALSE)
treeOrd <- resolveTreeChar(tree,trait,orderedChar = TRUE,stateBias = NULL)
treeOrdPrim <- resolveTreeChar(tree,trait,orderedChar = TRUE,stateBias = "primitive")
treeOrdDer <- resolveTreeChar(tree,trait,orderedChar = TRUE,stateBias = "derived")

#compare number of nodes
Nnode(tree)			#original
Nnode(treeUnord)		#unordered, biasStates = NULL, MPR
Nnode(treeOrd)		#ordered, biasStates = NULL
Nnode(treeOrdPrim)	#ordered, biasStates = 'primitive'
Nnode(treeOrdDer)	#ordered, biasStates = 'derived'

#let's compare original tree with unordered-resolved tree
layout(1:2)
quickAncPlot(tree,trait,orderedChar = FALSE,cex = 0.3)
text(x = 43,y = 10,"Original",cex = 1.5)
quickAncPlot(treeUnord,trait,orderedChar = FALSE,cex = 0.3)
text(x = 43,y = 10,"orderedChar = FALSE",cex = 1.5)
#some resolution gained

#now let's compare the original and ordered, both biasStates = NULL
layout(1:2)
quickAncPlot(tree,trait,orderedChar = FALSE,cex = 0.3)
text(x = 43,y = 10,"Original",cex = 1.5)
quickAncPlot(treeOrd,trait,orderedChar = TRUE,cex = 0.3)
text(x = 43,y = 10,"orderedChar = TRUE",cex = 1.5)

#now let's compare the three ordered trees
layout(1:3)
quickAncPlot(treeOrd,trait,orderedChar = TRUE,cex = 0.3)
text(x = 41,y = 8,"ordered, biasStates = NULL",cex = 1.5)
quickAncPlot(treeOrdPrim,trait,orderedChar = TRUE,cex = 0.3)
text(x = 41.5,y = 8,"ordered, biasStates = 'primitive'",cex = 1.5)
quickAncPlot(treeOrdDer,trait,orderedChar = TRUE,cex = 0.3)
text(x = 42,y = 8,"ordered, biasStates = 'derived'",cex = 1.5)

#let's compare unordered with ordered, biasStates = 'primitive'
layout(1:2)
quickAncPlot(treeUnord,trait,orderedChar = FALSE,cex = 0.3)
text(x = 41,y = 8,"orderedChar = FALSE",cex = 1.5)
quickAncPlot(treeOrdPrim,trait,orderedChar = TRUE,cex = 0.3)
text(x = 40,y = 11,"orderedChar = TRUE",cex = 1.5)
text(x = 40,y = 4,"biasStates = 'primitive'",cex = 1.5)


#these comparisons will differ greatly between datasets
	# need to try them on your own

layout(1)

## End(No test)




