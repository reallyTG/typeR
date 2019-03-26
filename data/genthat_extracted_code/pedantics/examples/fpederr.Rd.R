library(pedantics)


### Name: fpederr
### Title: Simulates a pedigree with errors and missing data from a
###   complete pedigree.
### Aliases: fpederr
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

## some missing sire links:
fpederr(truePedigree=pedigree,founders=testData$founder,
        sex=testData$sex,sireA=0.5,cohort=testData$cohort,
        first=testData$first,last=testData$last)$assumedPedigree

## some erroneous sire links:
fpederr(truePedigree=pedigree,founders=testData$founder,
        sex=testData$sex,sireE=0.5,cohort=testData$cohort,
        first=testData$first,last=testData$last)$assumedPedigree



