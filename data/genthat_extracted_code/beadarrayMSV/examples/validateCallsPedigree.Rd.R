library(beadarrayMSV)


### Name: validateCallsPedigree
### Title: Pedigree validation of genotypes
### Aliases: validateCallsPedigree validateSingleCall

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
##D #Genotype calling, pedigree validation and plotting
##D BSRed <- callGenotypes(BSRed)
##D BSRed <- validateCallsPedigree(BSRed)
##D plotGenotypes(BSRed,1:25)
## End(Not run)



