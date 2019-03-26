library(paleotree)


### Name: dateNodes
### Title: Absolute Dates for Nodes of a Time-Scaled Phylogeny
### Aliases: dateNodes

### ** Examples

#let's simulate some example data
set.seed(444)
record <- simFossilRecord(p = 0.1, q = 0.1, nruns = 1,
nTotalTaxa = c(30,40), nExtant = 0)
taxa <- fossilRecord2fossilTaxa(record)
#get the true time-sclaed tree
tree1 <- taxa2phylo(taxa)

#now let's try dateNodes
dateNodes(tree1)

#let's ignore $root.time
dateNodes(tree1,rootAge = NULL)

#with the lengthy tip-label based labels
   #some of these will be hideously long
dateNodes(tree1,labelDates = TRUE)



