library(beadarrayMSV)


### Name: normalizeShearedChannels
### Title: Channel normalization
### Aliases: normalizeShearedChannels

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
##D #Pre-process 1 array
##D normOpts <- setNormOptions(minSize=10)
##D BSData <- shearRawSignal(BSDataRaw, normOpts = normOpts)
##D noiseDist <- getNoiseDistributions(BSData, normInd = normInd,
##D     normOpts = normOpts)
##D trChannel <- transformChannels(assayData(BSData)$R,
##D     assayData(BSData)$G, normOpts = normOpts)
##D mafData <- normalizeShearedChannels(trChannel, noiseDist,
##D     normOpts = normOpts)
##D quantData <- normalizeShearedChannels(trChannel, noiseDist,
##D     normOpts = setNormOptions(method='quantNorm'))
##D 
##D #Plot distributions
##D dev.new()
##D par(mfrow=c(3,2))
##D hist(trChannel$X,breaks=30,col='red',main='Red channel')
##D hist(trChannel$Y,breaks=30,col='green',main='Green channel')
##D hist(mafData$X,breaks=30,col='red',main='medianAF')
##D hist(mafData$Y,breaks=30,col='green',main='medianAF')
##D hist(quantData$X,breaks=30,col='red',main='quantNorm')
##D hist(quantData$Y,breaks=30,col='green',main='quantNorm')
## End(Not run)



