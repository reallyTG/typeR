library(beadarrayMSV)


### Name: getNoiseDistributions
### Title: Estimate median and robust spread of background noise
### Aliases: getNoiseDistributions plotEstimatedNoise

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
##D normOpts <- setNormOptions(minSize=50,breaks=200)
##D BSData <- shearRawSignal(BSDataRaw, normOpts = normOpts,plot=TRUE)
##D noiseDist <- getNoiseDistributions(BSData[,1:4], normInd = normInd,
##D     normOpts = normOpts, plot = TRUE)
##D print(noiseDist)
##D plotEstimatedNoise(BSData,noiseDist,normOpts=normOpts)
## End(Not run)



