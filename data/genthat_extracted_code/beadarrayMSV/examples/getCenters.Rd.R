library(beadarrayMSV)


### Name: getCenters
### Title: Estimate starting points for clustering
### Aliases: getCenters getSpecificCenters

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
##D #Suggest some candidate categories with initial centre points
##D ind <- 2
##D sConf <- getCenters(assayData(BSRed)$theta[ind,],gO=gO,polyCent=polyCent))
##D print(sConf)
##D print(polyCent$classification[sConf$ix])
## End(Not run)



