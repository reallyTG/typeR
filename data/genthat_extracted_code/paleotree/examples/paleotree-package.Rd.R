library(paleotree)


### Name: paleotree-package
### Title: paleotree: Paleontological and Phylogenetic Analyses of
###   Evolution
### Aliases: paleotree-package paleotree

### ** Examples


# get the package version of paleotree
packageVersion("paleotree")

# get the citation for paleotree
citation("paleotree")

##Simulate some fossil ranges with simFossilRecord
set.seed(444);
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
#Now let's use binTimeData to bin in intervals of 10 time units
rangesDisc <- binTimeData(rangesCont,int.length = 10)
#plot with taxicDivDisc
taxicDivDisc(rangesDisc)
#compare to the continuous time diversity curve

layout(1)

#taxa2phylo assumes we know speciation events perfectly... what if we don't?
#first, let's use taxa2cladogram to get the 'ideal' cladogram of the taxa
cladogram <- taxa2cladogram(taxa,plot = TRUE)
#Now let's try timePaleoPhy using the continuous range data
ttree <- timePaleoPhy(cladogram,rangesCont,type = "basic",plot = TRUE)
#plot diversity curve
phyloDiv(ttree,drop.ZLB = TRUE)

#that tree lacked the terminal parts of ranges (tips stops at the taxon FADs)
#let's add those terminal ranges back on with add.term
ttree <- timePaleoPhy(cladogram,rangesCont,type = "basic",add.term = TRUE,plot = TRUE)
#plot diversity curve 
phyloDiv(ttree)




