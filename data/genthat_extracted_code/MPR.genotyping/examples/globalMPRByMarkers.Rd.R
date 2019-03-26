library(MPR.genotyping)


### Name: globalMPRByMarkers
### Title: MPR inference in whole chromosome
### Aliases: globalMPRByMarkers
### Keywords: MPR

### ** Examples

## No test: 
## load sample dataset
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
## End(No test)



