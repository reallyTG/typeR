library(BPEC)


### Name: bpec.treePlot
### Title: Treeplot indicating cluster membership
### Aliases: bpec.treePlot
### Keywords: tree phylogenetics haplotype

### ** Examples

#to use example dataset:
data(MacrocnemisRawSeqs)
data(MacrocnemisCoordsLocs)
coordsLocs <- MacrocnemisCoordsLocs
rawSeqs <- MacrocnemisRawSeqs

##to use your own dataset 
#rawSeqs <- bpec.loadSeq('haplotypes.nex')
#coordsLocs <- bpec.loadCoords("coordsLocsFile.txt")

## to set phenotypic/environmental covariate names manually, use (as appropriate)
# colnames(coordsLocs)[1:dims] <- c('lat','long','cov1','cov2','cov3')   
## where dims is the corresponding number of measurements available 
## (2 for latitude and longitude only, add one for each additional available measurement) 

#to run the MCMC sampler: 

bpecout <- bpec.mcmc(rawSeqs, coordsLocs, maxMig = 2, iter = 50, ds = 0, postSamples = 1, dims = 8)
bpec.Tree <- bpec.treePlot(bpecout)



