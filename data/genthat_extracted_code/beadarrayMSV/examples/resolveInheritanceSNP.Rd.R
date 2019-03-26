library(beadarrayMSV)


### Name: resolveInheritanceSNP
### Title: Track parental alleles in offspring
### Aliases: resolveInheritanceSNP

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
##D #Genotype calling and selection of SNPs for linkage map
##D BSRed <- callGenotypes(BSRed)
##D BSRed <- validateCallsPedigree(BSRed)
##D iSNP <- fData(BSRed)$Classification %in% 'SNP' &! is.na(fData(BSRed)$Chromosome)
##D 
##D #Find informative alleles inherited from each parent
##D inheritP <- resolveInheritanceSNP(BSRed[iSNP,])
##D 
##D #Compare a few markers for an arbitrary, single triplet
##D iOffspring <- 1
##D iFather <- which(pData(BSRed)$PedigreeID %in% pData(BSRed)$Parent2[iOffspring])
##D iMother <- which(pData(BSRed)$PedigreeID %in% pData(BSRed)$Parent1[iOffspring])
##D print(assayData(BSRed)$call[iSNP,c(iMother,iFather,iOffspring)][6:10,])
##D print(inheritP$mother[6:10,c(iMother,iFather,iOffspring)])
##D print(inheritP$father[6:10,c(iMother,iFather,iOffspring)])
## End(Not run)



