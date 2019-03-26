library(beadarrayMSV)


### Name: callGenotypes
### Title: Clustering and calling of genotypes
### Aliases: callGenotypes callGenotypes.interactive
###   callGenotypes.verboseTest setGenoOptions

### ** Examples

## Not run: 
##D #Read 25 markers into an AlleleSetIllumina object
##D rPath <- system.file("extdata", package="beadarrayMSV")
##D normOpts <- setNormOptions()
##D dataFiles <- makeFilenames('testdata',normOpts,rPath)
##D beadFile <- paste(rPath,'beadData_testdata.txt',sep='/')
##D beadInfo <- read.table(beadFile,sep='\t',header=TRUE,as.is=TRUE)
##D BSRed <- createAlleleSetFromFiles(dataFiles[1:4],markers=1:25,beadInfo=beadInfo)
##D 
##D #Genotype calling and validation
##D gO <- setGenoOptions(largeSample=TRUE)
##D BSRed <- callGenotypes(BSRed, gO=gO)
##D BSRed <- validateCallsPedigree(BSRed)
##D sumClass <- tapply(rep(1,nrow(BSRed)),fData(BSRed)$Classification,sum)
##D print(sumClass)
##D 
##D #Plot default setting calls
##D plotGenotypes(BSRed)
##D 
##D #Tune settings to call an initially failed marker
##D dev.new()
##D verboseRes <- callGenotypes.verboseTest(BSRed, gO=gO, singleMarker=23)
##D print(verboseRes$fData)
##D print(verboseRes$test)
##D gO <- setGenoOptions(largeSample=TRUE, wSpreadLim=.1, hwAlpha=1e-50)
##D verboseRes <- callGenotypes.verboseTest(BSRed, gO=gO, singleMarker=23)
##D 
##D #New settings give (likely incorrect) SNP-call
##D BSRed <- callGenotypes(BSRed, gO=gO)
##D BSRed <- validateCallsPedigree(BSRed)
##D dev.new()
##D plotGenotypes(BSRed)
## End(Not run)



