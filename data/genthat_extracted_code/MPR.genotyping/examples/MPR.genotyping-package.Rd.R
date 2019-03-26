library(MPR.genotyping)


### Name: MPR.genotyping-package
### Title: Maximum Parsimony of Recombination to Infer Parental Genotypes
### Aliases: MPR.genotyping-package MPR.genotyping
### Keywords: package

### ** Examples

data(myBaseData)
allele.random <- base2Allele(myBaseData)
allele.MPR <- localMPR(baseData=myBaseData,maxNStep=5,verbose = TRUE)
## No test: 
## The workflow of parent-independent genotyping
## load SNP alleles at putative SNP sites
data(snpData)
## load overlapping SNP alleles from low-depth sequences of one parent
data(markerData)

set.seed(123)

## select 30 markers randomly
markers <- sample(names(markerData)[10:50],20)

## select SNP sites which contain the 30 markers
ids <- match(markers,rownames(snpData))
str(myBaseData <- snpData[min(ids):max(ids),])

## global MPR aiding with marker data 
allele.MPR <- globalMPRByMarkers(myBaseData,markers=markerData,numTry=3,numBaseStep=50,
             numBaseCandidateStep=100,numMarkerStep=10,useMedianToFindKnown=TRUE,
             maxIterate=150,maxNStep=3,scoreMin=0.8,verbose=TRUE)

## genotypes at some SNP site may be missing due to concordence less than 80% (scoreMin)
table(is.na(alleleA <- allele.MPR[,1]))

## check with positive dataset. looks good but contains false SNPs and may be with some errors

## then you need to refine the MPR results
set.seed(123);system.time(all.res <- globalMPRRefine(myBaseData,alleleA=na.omit(
             allele.MPR[,1]),numGroup=238,groupSort=TRUE,numPerm=10,numTry=3,
             numBaseStep=50,numBaseCandidateStep=100,numKnownStep=30,
             numKnownCandidateStep=50,useMedianToFindKnown=TRUE,maxIterate=150,
             maxNStep=3,scoreMin=0.8,saveMidData=TRUE,verbose=TRUE))
			 
## summarize results using Bayesian inference
perm <- 10
res <- all.res$midData[[perm]]
table(geno.res <- genotypeCallsBayes(res$call,errorRate=1e-11,eps=1e-10,maxIterate=100,
             verbose=FALSE)$type)

## reconstruct parental genotypes
allele.MPR <- res$allele
allele.MPR[geno.res==2|apply(res$call,1,min)>=perm,] <- NA
allele.MPR[geno.res==3,] <- allele.MPR[geno.res==3,c(2,1)]

## the power of the MPR algorithm. lost 1 high quality SNP but removed >90% of inferior SNPs

## correct genotypes using HMM
snpSet <- sort(rownames(na.omit(allele.MPR)))
ids <- match(snpSet,rownames(myBaseData))
table(is.na(geno.data <- base2Geno_ori(myBaseData[ids,],allele.MPR[ids,])))

geno.data.cr <- geno.data
SNPbyChr <- split(1:nrow(geno.data),substr(rownames(geno.data),1,2))
for(chr in names(SNPbyChr)){
  cat("\r",chr)
  ids <- SNPbyChr[[chr]]
  geno.data.chr <- correctGeno(geno.data[ids,],correct.FUN=correctFUNHMM,
				hmmFUN=hmm.vitFUN.rils,geno.probability=c(0.4975, 0.4975,0.005),
				transitionFUN=phy2get.haldane.rils,
				emissionFUN=makeEmissionFUN(errorRate=0.0106))
  geno.data.cr[ids,] <- geno.data.chr
}
## End(No test)



