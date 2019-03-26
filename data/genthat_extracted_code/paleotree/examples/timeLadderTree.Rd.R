library(paleotree)


### Name: timeLadderTree
### Title: Resolve Polytomies by Order of First Appearance
### Aliases: timeLadderTree

### ** Examples

## No test: 
set.seed(444)
record <- simFossilRecord(p = 0.1, q = 0.1, nruns = 1,
nTotalTaxa = c(100,200))
taxa <- fossilRecord2fossilTaxa(record)
tree <- taxa2cladogram(taxa)
ranges <- sampleRanges(taxa,r = 0.5)
tree1 <- timeLadderTree(tree,ranges)
layout(1:2)
plot(ladderize(tree),show.tip.label = FALSE)
plot(ladderize(tree1),show.tip.label = FALSE)

#an example with applying timeLadderTree to discrete time data
rangeData <- binTimeData(ranges,int.len = 5)	#sim discrete range data
tree2 <- bin_timePaleoPhy(tree,timeList = rangeData,timeres = TRUE)
plot(ladderize(tree),show.tip.label = FALSE)
plot(ladderize(tree2),show.tip.label = FALSE)
axisPhylo() 

layout(1)
## End(No test)



