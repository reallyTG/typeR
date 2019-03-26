library(paleotree)


### Name: timeSliceTree
### Title: Time-Slicing a Phylogeny
### Aliases: timeSliceTree

### ** Examples


#a neat example of using phyloDiv with timeSliceTree 
   #to simulate doing extant-only phylogeny studies 
   #of diversification...in the past!
set.seed(444)
record <- simFossilRecord(p = 0.1, q = 0.1, nruns = 1,
nTotalTaxa = c(30,40), nExtant = 0)
taxa <- fossilRecord2fossilTaxa(record)
taxicDivCont(taxa)
#that's the whole diversity curve

#with timeSliceTree we could look at the lineage accumulation curve 
   #we'd get of species sampled at a point in time
tree <- taxa2phylo(taxa)
#use timeSliceTree to make tree of relationships up until time = 950 
tree950 <- timeSliceTree(tree,sliceTime = 950,plot = TRUE,drop.extinct = FALSE)

#use drop.extinct = T to only get the tree of lineages extant at time = 950
tree950 <- timeSliceTree(tree,sliceTime = 950,plot = FALSE,drop.extinct = TRUE)
#now its an ultrametric tree with many fewer tips...
#lets plot the lineage accumulation plot on a log scale
phyloDiv(tree950,plotLogRich = TRUE)




