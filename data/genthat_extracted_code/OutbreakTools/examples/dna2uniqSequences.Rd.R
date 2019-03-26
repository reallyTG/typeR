library(OutbreakTools)


### Name: dna2uniqSequences
### Title: Convert a DNAbin with duplicated sequences to the class
###   'uniqSequences'
### Aliases: dna2uniqSequences

### ** Examples

### get uniq sequences for individual 49

data(HorseFlu)
x <- HorseFlu

### create a subset DNAbin
id49 <- subset(x,individuals="49") # warning message is returned
dna49 <- get.dna(id49)[[1]]

### get a particular sequence id with summary.seq$uniqseqID4[5]
### get number of sequences length(summary.seq$uniqseqID4)
uniqdna49 <- dna2uniqSequences(dna49)




