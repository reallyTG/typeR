library(beadarrayMSV)


### Name: assignParalogues
### Title: Assign MSV-5 paralogs to chromosomes
### Aliases: assignParalogues setMergeOptions

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
##D #Genotype calling and splitting of MSV-5 paralogs
##D BSRed <- callGenotypes(BSRed)
##D BSRed <- validateCallsPedigree(BSRed)
##D iMSV5 <- fData(BSRed)$Classification %in% 'MSV-5' &
##D     fData(BSRed)$Ped.Errors %in% 0
##D singleCalls <- getSingleCalls(BSRed[iMSV5,])
##D paraCalls <- unmixParalogues(BSRed[iMSV5,],singleCalls)
##D 
##D #Genetic map SNPs and inherited parental alleles
##D iSNP <- fData(BSRed)$Classification %in% 'SNP' &!
##D     is.na(fData(BSRed)$Chromosome)
##D inheritP <- resolveInheritanceSNP(BSRed[iSNP,])
##D 
##D #Match paralogs with map
##D mO <- setMergeOptions(minC=1)
##D chromHits <- locateParalogues(BSRed[iSNP,],paraCalls,
##D    inheritP,mO$offspringLim,mO$ratioLim)
##D 
##D #The example data and map are too small to detect most homeologies
##D plotCountsChrom(chromHits$cPerMarker,1:sum(iMSV5),at=1:15,
##D    labels=dimnames(chromHits$c)[[2]],las=2)
##D 
##D #Only a few, single paralogs are succesfully assigned to chromosomes
##D mergedCalls <- assignParalogues(BSRed[iSNP,],BSRed[iMSV5],paraCalls,
##D    inheritP,singleCalls,cHits=chromHits$cPerMarker,mO=mO)
##D print(mergedCalls$chromPairs)
##D print(mergedCalls$x[,1:4])
## End(Not run)



