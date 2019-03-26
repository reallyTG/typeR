library(BarcodingR)


### Name: DNAbin2kmerFreqMatrix
### Title: Calculation of Kmer Frequency Matrix from DNAbin for Both
###   Reference and Query Sequences
### Aliases: DNAbin2kmerFreqMatrix
### Keywords: DNAbin2kmerFreqMatrix

### ** Examples

data(TibetanMoth) 
ref<-as.DNAbin(as.character(TibetanMoth[1:50,]))
que<-as.DNAbin(as.character(TibetanMoth[51:60,]))
out<-DNAbin2kmerFreqMatrix(ref,que,kmer=3)
out





