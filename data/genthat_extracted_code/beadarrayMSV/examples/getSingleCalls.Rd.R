library(beadarrayMSV)


### Name: getSingleCalls
### Title: Identify MSV-5 paralogs with equal genotypes
### Aliases: getSingleCalls

### ** Examples

## Not run: 
##D #Read markers into an AlleleSetIllumina object
##D rPath <- system.file("extdata", package="beadarrayMSV")
##D normOpts <- setNormOptions()
##D dataFiles <- makeFilenames('testdata',normOpts,rPath)
##D beadFile <- paste(rPath,'beadData_testdata.txt',sep='/')
##D beadInfo <- read.table(beadFile,sep='\t',header=TRUE,as.is=TRUE)
##D BSRed <- createAlleleSetFromFiles(dataFiles[1:4],beadInfo=beadInfo)
##D 
##D #Genotype calling and selection of some MSV-5s
##D BSRed <- callGenotypes(BSRed)
##D BSRed <- validateCallsPedigree(BSRed)
##D iMSV5 <- fData(BSRed)$Classification %in% 'MSV-5' &
##D     fData(BSRed)$Ped.Errors %in% 0
##D plotGenotypes(BSRed,markers=which(iMSV5))
##D 
##D #Find markers in question and compare
##D singleCalls <- getSingleCalls(BSRed[iMSV5,])
##D print(assayData(BSRed)$call[iMSV5,1:4])
##D print(singleCalls[,1:4])
## End(Not run)



