library(pedantics)


### Name: microsim
### Title: Simulates microsatellite data across a pedigree.
### Aliases: microsim
### Keywords: datagen

### ** Examples

pedigree<-as.data.frame(matrix(c(
"m1",	NA,	NA,
"m2",	NA,	NA,
"m3",	NA,	NA,
"d4",	NA,	NA,
"d5",	NA,	NA,
"o6",	"m1",	"d4",
"o7",	"m1",	"d4",
"o8",	"m1",	"d4",
"o9",	"m1",	"d4",
"o10",	"m2",	"d5",
"o11",	"m2",	"d5",
"o12",	"m2",	"d5",
"o13",	"m2",	"d5",
"o14",	"m3",	"d5",
"o15",	"m3",	"d5",
"o16",	"m3",	"d5",
"o17",	"m3",	"d5"),17,3,byrow=TRUE))
names(pedigree)<-c("id","dam","sire")
for(x in 1:3) pedigree[,x]<-as.factor(pedigree[,x])

## some sample genotypes, very simple, two markers with He = 0.5
sampleGenotypes<-as.data.frame(matrix(c(
                   1,2,1,2,2,1,2,1),2,4,byrow=TRUE))
## locus names
names(sampleGenotypes)<-c("loc1a","loc1b","loc2a","loc2b")

## simulate some genotypes
microsim(pedigree=pedigree,genotypesSample=sampleGenotypes)




