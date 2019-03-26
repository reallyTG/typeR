library(relSim)


### Name: locusIBS
### Title: Identity by state at a locus
### Aliases: locusIBS

### ** Examples


data(fbiCaucs)
G = randomSample(1, fbiCaucs, rel = 'FS', N = 1000)
ibs = locusIBS(G)
barplot(tabulate(ibs+1, nbins = 3))




