library(BPEC)


### Name: bpec.covariatesPlot
### Title: Plot posterior marginal distribution of each covariate for the
###   inferred clusters
### Aliases: bpec.covariatesPlot
### Keywords: clustering Bayesian covariates environmental phenotypic

### ** Examples

#to use example dataset:
data(MacrocnemisRawSeqs)
data(MacrocnemisCoordsLocs)
rawSeqs <- MacrocnemisRawSeqs
coordsLocs <- MacrocnemisCoordsLocs

##to use your own dataset 
#rawSeqs <- bpec.loadSeq('Haplotypes.nex')
#coordsLocs <- bpec.loadCoords("coordsLocsFile.txt")

## to set phenotypic/environmental covariate names manually, use (as appropriate)
# colnames(CoordsLocs)[1:dims] <- c('lat','long','cov1','cov2','cov3')   
## where dims is the corresponding number of measurements available 
## (2 for latitude and longitude only, add one for each additional available measurement) 

#for the analysis: 
#check the helpfile of bpec.mcmc using ?bpec.mcmc

bpecout <- bpec.mcmc(rawSeqs, coordsLocs, maxMig = 2, iter = 100, ds = 0, postSamples = 5, dims = 8)

#if there are also environmental covariates available: 
par(mfrow=c(2,3)) #this splits the plot window into 2x3 to fit all the covariates
bpec.covariatesPlot(bpecout)



