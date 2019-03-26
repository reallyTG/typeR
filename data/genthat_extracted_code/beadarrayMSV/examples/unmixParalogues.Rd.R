library(beadarrayMSV)


### Name: unmixParalogues
### Title: Partially resolve the paralogs of MSV-5s
### Aliases: unmixParalogues

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
##D iMSV5 <- fData(BSRed)$Classification %in% 'MSV-5' & fData(BSRed)$Ped.Errors %in% 0
##D plotGenotypes(BSRed,markers=which(iMSV5))
##D 
##D #Partial resolving of paralogs
##D paraCalls <- unmixParalogues(BSRed[iMSV5,])
##D 
##D #Compare for an arbitrary, single triplet
##D iOffspring <- 1
##D iFather <- which(pData(BSRed)$PedigreeID %in% pData(BSRed)$Parent2[iOffspring])
##D iMother <- which(pData(BSRed)$PedigreeID %in% pData(BSRed)$Parent1[iOffspring])
##D print(assayData(BSRed)$call[iMSV5,c(iMother,iFather,iOffspring)])
##D print(paraCalls$mother[,c(iMother,iFather,iOffspring)])
##D print(paraCalls$father[,c(iMother,iFather,iOffspring)])
## End(Not run)



