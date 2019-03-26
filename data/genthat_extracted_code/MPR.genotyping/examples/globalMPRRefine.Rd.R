library(MPR.genotyping)


### Name: globalMPRRefine
### Title: refine SNPs by resampling
### Aliases: globalMPRRefine
### Keywords: MPR

### ** Examples

## No test: 
data(snpData)
data(markerData)

## select 30 markers randomly
set.seed(123);markers <- sample(names(markerData)[10:50],20)

## select SNP sites which contain the 30 markers
ids <- match(markers,rownames(snpData))
str(myBaseData <- snpData[min(ids):max(ids),])

## global MPR aiding with marker data
allele.MPR <- globalMPRByMarkers(myBaseData,markers=markerData,numTry=3,
			numBaseStep=50,numBaseCandidateStep=100,
            numMarkerStep=10,useMedianToFindKnown=TRUE,
			maxNStep=3,scoreMin=0.8,verbose=TRUE)
			 
## then you need to refine the MPR results
set.seed(123);system.time(all.res <- globalMPRRefine(myBaseData,alleleA=na.omit(
            allele.MPR[,1]),numGroup=238,groupSort=TRUE,numPerm=1,numTry=3,
            numBaseStep=50,numBaseCandidateStep=100,numKnownStep=30,
            numKnownCandidateStep=50,useMedianToFindKnown=TRUE,
            maxNStep=3,scoreMin=0.8,saveMidData=TRUE,verbose=TRUE))
## End(No test)



