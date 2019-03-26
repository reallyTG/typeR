library(paleotree)


### Name: expandTaxonTree
### Title: Extrapolating Lower-Level Taxon Phylogenies from Higher-Level
###   Taxon Trees
### Aliases: expandTaxonTree

### ** Examples


set.seed(444)
#lets make our hypothetical simulated tree of higher taxa
taxtr <- rtree(10)
taxd <- sample(taxtr$tip.label,30,replace = TRUE)	#taxa to place within higher taxa
names(taxd) <- paste(taxd,"_x",1:30,sep = "")
coll <- sample(taxtr$tip.label,3)		#what to collapse?
expandTaxonTree(taxonTree = taxtr,taxaData = taxd,collapse = coll,plot = TRUE)




