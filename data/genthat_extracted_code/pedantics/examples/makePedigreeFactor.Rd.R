library(pedantics)


### Name: makePedigreeFactor
### Title: Converts a numeric pedigee to a pedigree with factors
### Aliases: makePedigreeFactor
### Keywords: manip

### ** Examples


## first we'll implement the example from makePedigreeNumeric(), 
## and use makePedigreeFactor() to turn it back again:

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

## make the test pedigree numeric with NAs denoted by -1
test<-makePedigreeNumeric(id=as.character(pedigree[,1]),
                          dam=as.character(pedigree[,2]),
                          sire=as.character(pedigree[,3]),
                          missingVal=-1)

test$numericPedigree

test$idKey

## and turn it back again
makePedigreeFactor(id=test$numericPedigree$id,
                          dam=test$numericPedigree$dam,
                          sire=test$numericPedigree$sire,
                          key=test$idKey)




