library(beadarrayMSV)


### Name: writeAlleleSet
### Title: Write AlleleSetIllumina data to files
### Aliases: writeAlleleSet

### ** Examples

## Not run: 
##D #Create an AlleleSetIllumina object using files in example data directory
##D rPath <- system.file("extdata", package="beadarrayMSV")
##D normOpts <- list(transf='root',method='medianAF')
##D dataFiles <- makeFilenames('testdata',normOpts,rPath)
##D beadFile <- paste(rPath,'beadData_testdata.txt',sep='/')
##D beadInfo <- read.table(beadFile,sep='\t',header=TRUE,as.is=TRUE)
##D BSRed <- createAlleleSetFromFiles(dataFiles[1:4],beadInfo=beadInfo)
##D 
##D #Write some data to files
##D writeFiles <- makeFilenames('test2',normOpts,path='.')
##D writeAlleleSet(writeFiles[1:4],BSRed[1:10,1:5])
## End(Not run)



