library(beadarrayMSV)


### Name: findPolyploidClusters
### Title: K-means clustering
### Aliases: findPolyploidClusters

### ** Examples

## Not run: 
##D #Read pre-processed data directly into AlleleSetIllumina object
##D rPath <- system.file("extdata", package="beadarrayMSV")
##D normOpts <- setNormOptions()
##D dataFiles <- makeFilenames('testdata',normOpts,rPath)
##D beadFile <- paste(rPath,'beadData_testdata.txt',sep='/')
##D beadInfo <- read.table(beadFile,sep='\t',header=TRUE,as.is=TRUE)
##D BSRed <- createAlleleSetFromFiles(dataFiles[1:4],markers=1:10,beadInfo=beadInfo)
##D 
##D #Generate list of marker categories
##D gO <- setGenoOptions()
##D polyCent <- generatePolyCenters(ploidy=gO$ploidy)
##D print(polyCent)
##D 
##D #Estimate list of likely center points for an MSV-5 marker
##D ind <- 2
##D dev.new(); par(mfrow=c(3,1),mai=c(.5,.5,.5,.1))
##D polyCl <- findClusters(assayData(BSRed)$theta[ind,],
##D     breaks=seq(-0.25,1.25,0.04),plot=TRUE)
##D print(polyCl)
##D 
##D #Clustering using all samples
##D sclR <- median(assayData(BSRed)$intensity[ind,],na.rm=TRUE)*ind*gO$rPenalty
##D X <- matrix(cbind(assayData(BSRed)$theta[ind,],
##D                   assayData(BSRed)$intensity[ind,]/sclR,
##D                   assayData(BSRed)$SE[ind,]),ncol=3)
##D clObj <- findPolyploidClusters(X,centers=polyCl$clPeaks,plot=TRUE)
##D plot(X[,1],X[,2],col=clObj$cluster)
##D print(clObj)
## End(Not run)



