library(bcRep)


### Name: aaDistribution
### Title: Amino acid distribution of sequences
### Aliases: aaDistribution plotAADistribution

### ** Examples

data(aaseqtab)
aadistr<-aaDistribution(sequences = aaseqtab$CDR3_IMGT, numberSeq = TRUE)
## Not run: 
##D plotAADistribution(aaDistribution.tab=aadistr, plotAADistr=TRUE, plotSeqN=FALSE, 
##D      PDF="test")
## End(Not run)



