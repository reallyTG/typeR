library(beadarrayMSV)


### Name: createAlleleSet
### Title: Create AlleleSetIllumina or MultiSet objects
### Aliases: createAlleleSet createAlleleSetFromFiles
###   createMultiSetFromFiles assignToAlleleSet

### ** Examples

## Not run: 
##D #Read raw data files into BeadSetIllumina object
##D rPath <- system.file("extdata", package="beadarrayMSV")
##D BSDataRaw <- readBeadSummaryOutput(path=rPath,recursive=TRUE)
##D 
##D #Find indexes to sub-bead pools
##D beadInfo <- read.table(paste(rPath,'beadData.txt',sep='/'),sep='\t',
##D     header=TRUE,as.is=TRUE)
##D rownames(beadInfo) <- make.names(beadInfo$Name)
##D normInd <- getNormInd(beadInfo,featureNames(BSDataRaw))
##D 
##D #Pre-process BSData
##D normOpts <- setNormOptions(minSize=10)
##D plotPreprocessing(BSDataRaw,normInd,normOpts,plotArray=1)
##D BSData <- preprocessBeadSet(BSDataRaw,normInd,normOpts)
##D print(BSData)
##D print(fData(BSData)[1:10,])
##D print(fvarMetadata(BSData))
##D 
##D #Convert to AlleleSetIllumina-object
##D BSRed <- createAlleleSet(BSData,beadInfo,normOpts)
##D print(BSRed)
##D print(fData(BSRed)[1:10,])
##D print(fvarMetadata(BSRed))
##D 
##D #Read pre-processed data directly into AlleleSetIllumina object
##D dataFiles <- makeFilenames('testdata',normOpts,rPath)
##D beadFile <- paste(rPath,'beadData_testdata.txt',sep='/')
##D beadInfo2 <- read.table(beadFile,sep='\t',header=TRUE,as.is=TRUE)
##D BSRed <- createAlleleSetFromFiles(dataFiles[1:4],beadInfo=beadInfo2)
##D print(varLabels(BSRed))
## End(Not run)



