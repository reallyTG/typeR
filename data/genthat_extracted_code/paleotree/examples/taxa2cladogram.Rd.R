library(paleotree)


### Name: taxa2cladogram
### Title: Convert Simulated Taxon Data into a Cladogram
### Aliases: taxa2cladogram

### ** Examples

## No test: 
set.seed(444)
record <- simFossilRecord(p = 0.1, q = 0.1, nruns = 1,
nTotalTaxa = c(30,40), nExtant = 0)
taxa <- fossilRecord2fossilTaxa(record)
#let's use taxa2cladogram to get the 'ideal' cladogram of the taxa
layout(1:2)
cladogram <- taxa2cladogram(taxa,plot = TRUE)
#compare the "real" time-scaled tree of taxon last occurrences (taxa2phylo) 
     #to the 'ideal' cladogram
tree <- taxa2phylo(taxa,plot = TRUE)

#testing with cryptic speciation
recordCrypt <- simFossilRecord(p = 0.1, q = 0.1, prop.cryptic = 0.5, nruns = 1,
nTotalTaxa = c(30,40), nExtant = 0)
taxaCrypt <- fossilRecord2fossilTaxa(recordCrypt)
layout(1:2)
parOrig <- par(no.readonly = TRUE)
par(mar = c(0,0,0,0))
cladoCrypt1 <- taxa2cladogram(taxaCrypt,drop.cryptic = FALSE)
plot(cladoCrypt1)
cladoCrypt2 <- taxa2cladogram(taxaCrypt,drop.cryptic = TRUE)
plot(cladoCrypt2)

#reset plotting
par(parOrig)
layout(1) 
## End(No test)



