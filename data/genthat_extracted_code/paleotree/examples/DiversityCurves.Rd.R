library(paleotree)


### Name: DiversityCurves
### Title: Diversity Curves
### Aliases: DiversityCurves taxicDivCont taxicDivDisc phyloDiv
###   taxicDivDisc phyloDiv

### ** Examples


#taxicDivDisc with the retiolinae dataset
data(retiolitinae)
taxicDivDisc(retioRanges)

#simulation examples
set.seed(444)
record <- simFossilRecord(p = 0.1, q = 0.1, nruns = 1,
nTotalTaxa = c(30,40), nExtant = 0)
taxa <- fossilRecord2fossilTaxa(record)
#let's see what the 'true' diversity curve looks like in this case
#plot the FADs and LADs with taxicDivCont()
taxicDivCont(taxa)
#simulate a fossil record with imperfect sampling with sampleRanges
rangesCont <- sampleRanges(taxa,r = 0.5)
#plot the diversity curve based on the sampled ranges
layout(1:2)
taxicDivCont(rangesCont)
#Now let's use binTimeData to bin in intervals of 1 time unit
rangesDisc <- binTimeData(rangesCont,int.length = 1)
#plot with taxicDivDisc
taxicDivDisc(rangesDisc)
#compare to the continuous time diversity curve

layout(1)
#Now let's make a tree using taxa2phylo
tree <- taxa2phylo(taxa,obs_time = rangesCont[,2])
phyloDiv(tree)

#a simple example with phyloDiv
  #using a tree from rtree in ape
set.seed(444)
tree <- rtree(100)
phyloDiv(tree)

#a neat example of using phyDiv with timeSliceTree 
 #to simulate doing molecular-phylogeny studies 
 #of diversification...in the past
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
tree950 <- timeSliceTree(tree,sliceTime = 950,plot = TRUE,drop.extinct = TRUE)
#now its an ultrametric tree with many fewer tips...
#lets plot the lineage accumulation plot on a log scale
phyloDiv(tree950,plotLogRich = TRUE)

#an example of a 'spiky' diversity curve and why split.int is a good thing
set.seed(444)
record <- simFossilRecord(p = 0.1, q = 0.1, nruns = 1,
nTotalTaxa = c(30,40), nExtant = 0)
taxa <- fossilRecord2fossilTaxa(record)
taxaDiv <- taxicDivCont(taxa)
#simulate a fossil record with imperfect sampling with sampleRanges()
rangesCont <- sampleRanges(taxa,r = 0.5)
rangesDisc <- binTimeData(rangesCont,int.length = 10)
#now let's plot with taxicDivDisc() but with the intervals from taxaDiv
 #by default, split.int = TRUE
taxicDivDisc(rangesDisc,int.times = taxaDiv[,1:2],split.int = TRUE)
#look pretty
#now let's turn off split.int
taxicDivDisc(rangesDisc,int.times = taxaDiv[,1:2],split.int = FALSE)
#looks 'spiky'!




