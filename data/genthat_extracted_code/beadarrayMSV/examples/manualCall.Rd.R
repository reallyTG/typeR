library(beadarrayMSV)


### Name: manualCall
### Title: Interactive calling of genotype for single marker
### Aliases: manualCall

### ** Examples

## Not run: 
##D #Read 10 markers into an AlleleSetIllumina object
##D rPath <- system.file("extdata", package="beadarrayMSV")
##D normOpts <- setNormOptions()
##D dataFiles <- makeFilenames('testdata',normOpts,rPath)
##D beadFile <- paste(rPath,'beadData_testdata.txt',sep='/')
##D beadInfo <- read.table(beadFile,sep='\t',header=TRUE,as.is=TRUE)
##D BSRed <- createAlleleSetFromFiles(dataFiles[1:4],markers=1:10,
##D     beadInfo=beadInfo)
##D 
##D #Prepare a single marker
##D ind <- 2
##D marker <- data.frame(Theta=assayData(BSRed)$theta[ind,],
##D     R=assayData(BSRed)$intensity[ind,],
##D     PedigreeID=pData(BSRed)$PedigreeID,
##D     stringsAsFactors=FALSE)
##D 
##D #Cluster marker from scratch, assuming MSV-5
##D polyCent <- generatePolyCenters(ploidy="tetra")
##D iMSV5 <- 7
##D marker1 <- manualCall(marker,cntIdeal=polyCent$centers[[iMSV5]],
##D     classification=polyCent$classification[[iMSV5]],close.gg=FALSE)
## End(Not run)



