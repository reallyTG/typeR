library(MPR.genotyping)


### Name: localMPR
### Title: infer parental genotypes by minimizing the number of
###   recombination events
### Aliases: localMPR
### Keywords: MPR

### ** Examples

set.seed(123)
## select 50 SNP sites to test inference of parental genotypes from snpData.rda
data(myBaseData)

## random assignments of parental genotypes to alleles will result in
## a big number of recombinations 
allele.random <- base2Allele(myBaseData)

## a big number of recombinations
NumRecomEvents(myBaseData,allele.random)
## 162

## MPR inference with maximum step size of 5
allele.MPR <- localMPR(baseData=myBaseData,maxIterate=50,maxNStep=5,showDetail=TRUE)

## should be a small number compared with random assignments above 
NumRecomEvents(myBaseData,allele.MPR)
## 33



