library(beadarrayMSV)


### Name: getNormInd
### Title: Retrieve sub-bead pool indexes
### Aliases: getNormInd

### ** Examples

## Not run: 
##D #Common use includes BeadSetIllumina-object
##D rPath <- system.file("extdata", package="beadarrayMSV")
##D BSDataRaw <- readBeadSummaryOutput(path=rPath,recursive=TRUE)
##D beadInfo <- read.table(paste(rPath,'beadData.txt',sep='/'),sep='\t',
##D     header=TRUE,as.is=TRUE)
##D rownames(beadInfo) <- make.names(beadInfo$Name)
##D normInd <- getNormInd(beadInfo,featureNames(BSDataRaw))
## End(Not run)



