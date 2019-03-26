library(paleotree)


### Name: branchClasses
### Title: Partitions the branch lengths of a tree into several classes
###   based on their placement.
### Aliases: branchClasses

### ** Examples

#simulated example
set.seed(444)
record <- simFossilRecord(p = 0.1, q = 0.1, nruns = 1,
nTotalTaxa = c(30,40), nExtant = c(10,20))
taxa <- fossilRecord2fossilTaxa(record)
tree <- taxa2phylo(taxa)
brlenRes <- branchClasses(tree)

#see frequency histograms of branch lengths
layout(1:4)
for(x in 1:length(brlenRes)){ 
	hist(brlenRes[[x]],main = "Branch Lengths",xlab = names(brlenRes)[x])
	}

#see frequency histograms of branch depths
layout(1:4)
for(x in 1:length(brlenRes)){ 
	hist(as.numeric(names(brlenRes[[x]])),main = "Branch Depths",xlab = names(brlenRes)[x])
	}

layout(1)



