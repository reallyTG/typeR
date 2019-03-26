library(beadarrayMSV)


### Name: countFailedSNP
### Title: Calculate ratio of called markers for each array
### Aliases: countFailedSNP

### ** Examples

## Not run: 
##D #Read pre-processed data directly into AlleleSetIllumina object
##D rPath <- system.file("extdata", package="beadarrayMSV")
##D normOpts <- setNormOptions()
##D dataFiles <- makeFilenames('testdata',normOpts,rPath)
##D beadFile <- paste(rPath,'beadData_testdata.txt',sep='/')
##D beadInfo <- read.table(beadFile,sep='\t',header=TRUE,as.is=TRUE)
##D BSRed <- createAlleleSetFromFiles(dataFiles[1:4],beadInfo=beadInfo)
##D 
##D #Genotype calling
##D BSRed <- callGenotypes(BSRed)
##D BSRed <- validateCallsPedigree(BSRed)
##D BSRed <- countFailedSNP(BSRed,inclPedErrors=TRUE)
##D print(range(pData(BSRed)$passRatio))
##D 
##D #Plot highlighting markers to be discarded
##D #NB! Such a high passRatio is not recommended
##D indGoodArrays <- pData(BSRed)$passRatio > 0.6
##D plotGenotypes(BSRed,indHighlight=which(!indGoodArrays))
## End(Not run)



