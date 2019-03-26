library(BPEC)


### Name: bpec.geoTree
### Title: Phylogeographic GoogleEarth plot
### Aliases: bpec.geoTree
### Keywords: tree phylogenetics haplotype

### ** Examples

## Not run: 
##D #to use example dataset:
##D data(MacrocnemisRawSeqs)
##D data(MacrocnemisCoordsLocs)
##D coordsLocs <- MacrocnemisCoordsLocs
##D rawSeqs <- MacrocnemisRawSeqs
##D 
##D ## to use your own dataset
##D # rawSeqs <- bpec.loadSeq('Haplotypes.nex')
##D # coordsLocs <- bpec.loadCoords("coordsLocsFile.txt")
##D 
##D ## to set phenotypic/environmental covariate names manually, use (as appropriate)
##D # colnames(coordsLocs)[1:dims] <- c('lat','long','cov1','cov2','cov3')   
##D ## where dims is the corresponding number of measurements available 
##D ## (2 for latitude and longitude only, add one for each additional available measurement) 
##D 
##D #to run the MCMC sampler: 
##D bpecout <- bpec.mcmc(rawSeqs, coordsLocs, maxMig = 2, iter = 50, ds = 0, postSamples = 5, dims = 8)
##D bpec.Geo <- bpec.geoTree(bpecout, file = "GoogleEarthTree.kml")
## End(Not run)



