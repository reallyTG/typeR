library(BPEC)


### Name: bpec
### Title: Bayesian Phylogeographic and Ecological Clustering (BPEC)
### Aliases: bpec plot.bpec summary.bpec mean.bpec print.bpec
### Keywords: phylogeography clustering Bayesian phylogenetics

### ** Examples

## if you want to load the `mini' example Brown Frog dataset
data(MacrocnemisRawSeqs)
data(MacrocnemisCoordsLocsMini)
rawSeqs <- MacrocnemisRawSeqs
coordsLocs <- MacrocnemisCoordsLocsMini

dims <- 3 #this is 2 if you only have geographical longitude/latitude. 
#(add 1 for each environmental or phenotypic covariate)
maxMig <- 2 #you will need a higher maximum number of migrations, suggest 7
ds <- 0 #start with ds=0 and increase to 1 and then to 2
iter <- 1000 #you will need far more iterations for convergence, start with 100,000
postSamples <- 100 #you will need at least 100 saved posterior samples

#run the Markov chain Monte Carlo sampler
bpecout <- bpec.mcmc(rawSeqs,coordsLocs,maxMig,iter,ds,postSamples,dims)

par(mar=c(0,0,0,0),pty="m",mfrow=c(1,2))  #no plot margins, plot contours and tree side-by-side
# plot geographical cluster contour map
bpec.contourPlot(bpecout,GoogleEarth=0) 

# plot tree network with cluster indicators
bpec.Tree <- bpec.treePlot(bpecout)   

# now also plot the environmental covariates
 bpec.covariatesPlot(bpecout) 
 
 bpec.Geo <- bpec.geoTree(bpecout,file="GoogleEarthTree.kml")


## Not run: 
##D # if you want to load the example burnet moth dataset
##D data(TransalpinaRawSeqs)
##D data(TransalpinaCoordsLocs)
##D rawSeqs <- TransalpinaRawSeqs
##D coordsLocs <- TransalpinaCoordsLocs
##D 
##D ##if you want to use your own dataset, use setwd() to enter the correct folder, 
##D ##then run the command below, changing the input parameters if necessary
##D  #rawSeqs <- bpec.loadSeq('haplotypes.nex')
##D  #coordsLocs <- bpec.loadCoords("coordsLocsFile.txt")
##D 
##D  ## to set phenotypic/environmental covariate names manually, use (as appropriate)
##D # colnames(CoordsLocs)[1:dims] <- c('lat','long','cov1','cov2','cov3')  
##D ## where dims is the corresponding number of measurements available 
##D ## (2 for latitude and longitude only, add one for each additional available measurement) 
##D  
##D dims <- 2 #this is 2 if you only have geographical longitude/latitude. 
##D #(add 1 for each environmental or phenotypic covariate)
##D maxMig <- 5 #you will need a higher maximum number of migrations, suggest 7
##D ds <- 0 #start with ds=0 and increase to 1 and then to 2
##D iter <- 10000 #you will need far more iterations for convergence, start with 100,000
##D postSamples <- 2 #you will need at least 100 saved posterior samples
##D 
##D #run the Markov chain Monte Carlo sampler
##D bpecout <- bpec.mcmc(rawSeqs,coordsLocs,maxMig,iter,ds,postSamples,dims)
##D 
##D par(mar=c(0,0,0,0),pty="m",mfrow=c(1,2)) #No plot margins. Contours and tree side-by-side
##D # plot geographical cluster contour map
##D bpec.contourPlot(bpecout, GoogleEarth=0, mapType = 'plain') 
##D 
##D # plot tree network with cluster indicators
##D bpec.Tree <- bpec.treePlot(bpecout)  
##D 
##D ## if you want to load the example Brown Frog dataset
##D data(MacrocnemisRawSeqs)
##D data(MacrocnemisCoordsLocs)
##D rawSeqs <- MacrocnemisRawSeqs
##D coordsLocs <- MacrocnemisCoordsLocs
##D 
##D dims <- 8 #this is 2 if you only have geographical longitude/latitude. 
##D #(add 1 for each environmental or phenotypic covariate)
##D maxMig <- 4 #you will need a higher maximum number of migrations, suggest 7
##D ds <- 2 #start with ds=0 and increase to 1 and then to 2
##D iter <- 10000 #you will need far more iterations for convergence, start with 100,000
##D postSamples <- 2 #you will need at least 100 saved posterior samples
##D 
##D #run the Markov chain Monte Carlo sampler
##D bpecout <- bpec.mcmc(rawSeqs,coordsLocs,maxMig,iter,ds,postSamples,dims)
##D 
##D par(mar=c(0,0,0,0),pty="m",mfrow=c(1,2))  #no plot margins, plot contours and tree side-by-side
##D # plot geographical cluster contour map
##D bpec.contourPlot(bpecout,GoogleEarth=0) 
##D 
##D # plot tree network with cluster indicators
##D bpec.Tree <- bpec.treePlot(bpecout)   
##D 
##D # now also plot the environmental covariates
##D  par(mfrow=c(2,3)) #split the plot window into 2x3 to fit all the covariates
##D  bpec.covariatesPlot(bpecout) 
##D  
##D  bpec.Geo <- bpec.geoTree(bpecout,file="GoogleEarthTree.kml")
##D  
## End(Not run)






