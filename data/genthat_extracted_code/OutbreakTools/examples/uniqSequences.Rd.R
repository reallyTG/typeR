library(OutbreakTools)


### Name: uniqSequences-class
### Title: Formal class "uniqSequences"
### Aliases: uniqSequences uniqSequences-class
###   initialize,uniqSequences-method
### Keywords: classes

### ** Examples


## EMPTY OBJECT
new("uniqSequences")

## LOAD RAW DATA
data(HorseFlu)

## GET SEQUENCES FROM THE FIRST 3 INDIVIDUALS
## all sequences
dna <- get.dna(subset(HorseFlu, individuals=1:3))[[1]]
dna

if(require(ape)){
plot(nj(dist.dna(dna)), type="unr")
title("NJ tree - all sequences")

## only unique sequences
dna2 <- dna2uniqSequences(dna)
dna2
plot(nj(dist.dna(dna2@uniqdna)), type="unr")
title("NJ tree - only unique sequences")

}



