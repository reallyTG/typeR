library(AnnotationBustR)


### Name: FindLongestSeq
### Title: Find the longest sequence for each species from a list of
###   GenBank accession numbers.
### Aliases: FindLongestSeq

### ** Examples

#a vector of 4 genbank accessions, there are two for each species.
genbank.accessions<-c("KP978059.1","KP978060.1","JX516105.1","JX516111.1")
#returns the longest sequence respectively for the two species.
long.seq.result<-FindLongestSeq(genbank.accessions)



