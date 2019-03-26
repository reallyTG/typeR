library(BPEC)


### Name: bpec.contourPlot
### Title: Plot contours of inferred clusters on geographical map
### Aliases: bpec.contourPlot
### Keywords: map Bayesian contours

### ** Examples

#to use example dataset:
data(MacrocnemisRawSeqs)
data(MacrocnemisCoordsLocs)
rawSeqs <- MacrocnemisRawSeqs
coordsLocs <- MacrocnemisCoordsLocs

##to use your own dataset: 
#rawSeqs <- bpec.loadSeq('Haplotypes.nex')
#coordsLocs <- bpec.loadCoords("coordsLocsFile.txt")

## to set phenotypic/environmental covariate names manually, use (as appropriate)
# colnames(coordsLocs)[1:dims] <- c('lat','long','cov1','cov2','cov3')   
## where dims is the corresponding number of measurements available 
## (2 for latitude and longitude only, add one for each additional available measurement) 

#for the analysis: 
#check the helpfile of bpec.mcmc using ?bpec.mcmc
colorCode <- c(7,5,6,3,2,8) #default colour scheme
bpecout <- bpec.mcmc(rawSeqs, coordsLocs, maxMig = 2, iter = 20, ds = 0, postSamples = 2, dims = 8)
bpec.contourPlot(bpecout, GoogleEarth = 0, colorCode, mapType = 'plain') 



