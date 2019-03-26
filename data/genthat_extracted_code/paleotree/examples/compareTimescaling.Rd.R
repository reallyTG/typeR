library(paleotree)


### Name: compareTimescaling
### Title: Comparing the Time-Scaling of Trees
### Aliases: compareTimescaling compareNodeAges compareTermBranches
###   compareTermBranches

### ** Examples


set.seed(444)
record <- simFossilRecord(p = 0.1, q = 0.1, nruns = 1,
nTotalTaxa = c(30,40), nExtant = 0)
taxa <- fossilRecord2fossilTaxa(record)
#get the true tree
tree1 <- taxa2phylo(taxa)
#simulate a fossil record with imperfect sampling with sampleRanges()
rangesCont <- sampleRanges(taxa,r = 0.5)
#let's use taxa2cladogram to get the 'ideal' cladogram of the taxa
cladogram <- taxa2cladogram(taxa,plot = TRUE)
#Now let's try timePaleoPhy using the continuous range data
tree2 <- timePaleoPhy(cladogram,rangesCont,type = "basic")
#let's look at the distribution of node shifts
hist(compareNodeAges(tree1,tree2))
#let's look at the distribution of terminal branch lengths
hist(compareTermBranches(tree1,tree2))

#testing ability to compare multiple trees with compareNodeAges
trees <- cal3TimePaleoPhy(cladogram,rangesCont,brRate = 0.1,extRate = 0.1,
    sampRate = 0.1,ntrees = 10)
nodeComparison <- compareNodeAges(tree1,trees)
#plot it as boxplots for each node
boxplot(nodeComparison,names = NULL);abline(h = 0)
#plot mean shift in node dates
abline(h = mean(apply(nodeComparison,2,mean,na.rm = TRUE)),lty = 2)

#just shifting a tree back in time
set.seed(444)
tree1 <- rtree(10)
tree2 <- tree1
tree1$root.time <- 10
compareNodeAges(tree1,tree2)
compareTermBranches(tree1,tree2)




