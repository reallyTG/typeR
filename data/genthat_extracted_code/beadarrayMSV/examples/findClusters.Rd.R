library(beadarrayMSV)


### Name: findClusters
### Title: Suggest clusters based on histograms
### Aliases: findClusters

### ** Examples

## Not run: 
##D #Read pre-processed data directly into AlleleSetIllumina object
##D rPath <- system.file("extdata", package="beadarrayMSV")
##D dataFiles <- makeFilenames('testdata',normOpts,rPath)
##D beadFile <- paste(rPath,'beadData_testdata.txt',sep='/')
##D beadInfo <- read.table(beadFile,sep='\t',header=TRUE,as.is=TRUE)
##D BSRed <- createAlleleSetFromFiles(dataFiles[1:4],markers=1:10,beadInfo=beadInfo)
##D 
##D #Tune resolution or filter to achieve monomorphic marker
##D print(findClusters(assayData(BSRed)$theta[1,],plot=TRUE))
##D print(findClusters(assayData(BSRed)$theta[1,],breaks=seq(-0.25,1.25,0.1),plot=TRUE))
##D print(findClusters(assayData(BSRed)$theta[1,],minBin=5,plot=TRUE))
##D 
##D #Tune resolution to achieve MSV-5 call
##D par(mfrow=c(3,1),mai=c(.5,.5,.5,.1))
##D plot(assayData(BSRed)$theta[2,],assayData(BSRed)$intensity[2,],pch='o')
##D print(findClusters(assayData(BSRed)$theta[2,],plot=TRUE))
##D print(findClusters(assayData(BSRed)$theta[2,],breaks=seq(-0.25,1.25,0.04),plot=TRUE))
## End(Not run)



