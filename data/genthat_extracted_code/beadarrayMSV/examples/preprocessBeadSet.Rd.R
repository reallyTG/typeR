library(beadarrayMSV)


### Name: preprocessBeadSet
### Title: Pre-processing of BeadSetIllumina objects
### Aliases: preprocessBeadSet setNormOptions plotPreprocessing

### ** Examples

## Not run: 
##D #Read files into BeadSetIllumina-object
##D rPath <- system.file("extdata", package="beadarrayMSV")
##D BSDataRaw <- readBeadSummaryOutput(path=rPath,recursive=TRUE)
##D 
##D #Find indexes to sub-bead pools
##D beadInfo <- read.table(paste(rPath,'beadData.txt',sep='/'),sep='\t',
##D     header=TRUE,as.is=TRUE)
##D rownames(beadInfo) <- make.names(beadInfo$Name)
##D normInd <- getNormInd(beadInfo,featureNames(BSDataRaw))
##D 
##D #Pre-process
##D normOpts <- setNormOptions(minSize=10)
##D plotPreprocessing(BSDataRaw,normInd,normOpts,plotArray=1)
##D BSData <- preprocessBeadSet(BSDataRaw,normInd,normOpts)
##D pData(BSData)
## End(Not run)



