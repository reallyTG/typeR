library(pedantics)


### Name: genomesim
### Title: A function to simulate QTL and/or SNP data.
### Aliases: genomesim
### Keywords: datagen

### ** Examples

testData<-as.data.frame(matrix(c(
1,	NA,	NA,	1,	1,	1,	2,	2,
2,	NA,	NA,	1,	1,	1,	2,	2,
3,	NA,	NA,	1,	1,	1,	2,	2,
4,	NA,	NA,	1,	0,	1,	2,	2,
5,	NA,	NA,	1,	0,	1,	2,	2,
6,	1,	4,	0,	-1,	2,	3,	3,
7,	1,	4,	0,	-1,	2,	3,	3,
8,	1,	4,	0,	-1,	2,	3,	3,
9,	1,	4,	0,	-1,	2,	3,	3,
10,	2,	5,	0,	-1,	2,	3,	3,
11,	2,	5,	0,	-1,	2,	3,	3,
12,	2,	5,	0,	-1,	2,	3,	3,
13,	2,	5,	0,	-1,	2,	3,	3,
14,	3,	5,	0,	-1,	2,	3,	3,
15,	3,	5,	0,	-1,	2,	3,	3,
16,	3,	5,	0,	-1,	2,	3,	3,
17,	3,	5,	0,	-1,	2,	3,	3),
17,8,byrow=TRUE))

names(testData)<-c("id","dam","sire","founder","sex",
                                   "cohort","first","last")
pedigree<-as.data.frame(cbind(testData$id,testData$dam,
                                            testData$sire))
for(x in 1:3) pedigree[,x]<-as.factor(pedigree[,x])
names(pedigree)<-c("id","dam","sire")
pedigree

##make up some microsatellite and gene allele frquencies:
sampleGenotypes<-as.data.frame(matrix(c(
                   1,2,-1.32,0.21,2,1,0.21,0.21),2,4,byrow=TRUE))
testFreqs<-extractA(sampleGenotypes)

## note that alleles at the gene locus are given as their
## allelic substitution effects:
testFreqs

## simulate data for these indivdiuals based on a single QTL 
## with two equally alleles with balanced frequencies in the 
## founders, linked (2 cM) to a highly  polymorphic microsatellite:
genomesim(pedigree=pedigree,founders=testData$founder,positions=c(0,2),
     mutationType=c('Micro','cIAM'),mutationRate=c(0,0),
     initFreqs=testFreqs,returnG='y')
## since we specified returnG='y', we can check that 
## the phenotypes add up to the
## allelic substitution effects for the second locus.




