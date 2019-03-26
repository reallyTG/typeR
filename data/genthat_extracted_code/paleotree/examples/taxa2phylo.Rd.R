library(paleotree)


### Name: taxa2phylo
### Title: Convert Simulated Taxon Data into a Phylogeny
### Aliases: taxa2phylo

### ** Examples


set.seed(444)
record <- simFossilRecord(p = 0.1, q = 0.1, nruns = 1,
 	nTotalTaxa = c(30,40), nExtant = 0)
taxa <- fossilRecord2fossilTaxa(record)
#let's use taxa2cladogram to get the 'ideal' cladogram of the taxa
tree <- taxa2phylo(taxa)
phyloDiv(tree)

#now a phylogeny with tips placed at the apparent time of extinction for each taxon
rangesCont <- sampleRanges(taxa,r = 0.5)
tree <- taxa2phylo(taxa,obs_time = rangesCont[,2])
phyloDiv(tree,drop.ZLB = FALSE)
#note that it drops taxa which were never sampled!

#testing with cryptic speciation
set.seed(444)
record <- simFossilRecord(p = 0.1, q = 0.1, prop.cryptic = 0.5, nruns = 1,
 	nTotalTaxa = c(30,40), nExtant = 0, count.cryptic = TRUE)
taxaCrypt <- fossilRecord2fossilTaxa(record)
treeCrypt <- taxa2phylo(taxaCrypt)
layout(1)
plot(treeCrypt)
axisPhylo()




