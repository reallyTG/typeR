library(beadarrayMSV)


### Name: translateTheta
### Title: Convert genotype calls to allele information
### Aliases: translateTheta translateThetaCombined translateThetaFromFiles

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
##D #Genotype calling
##D BSRed <- callGenotypes(BSRed)
##D genotypes <- translateTheta(assayData(BSRed)$call,fData(BSRed),type='regular')
##D print(cbind(fData(BSRed)$Classification,genotypes[,1:3])[1:10,])
##D 
##D #Alternative output
##D BSRed <- translateThetaCombined(BSRed)
##D print(cbind(fData(BSRed)$Classification,assayData(BSRed)$genotype[,1:3])[1:10,])
## End(Not run)



