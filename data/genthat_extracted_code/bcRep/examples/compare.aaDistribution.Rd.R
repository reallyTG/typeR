library(bcRep)


### Name: compare.aaDistribution
### Title: Compare amino acid distribution of different samples
### Aliases: compare.aaDistribution plotCompareAADistribution

### ** Examples

data(aaseqtab)
data(aaseqtab2)

AAdistr.comp<-compare.aaDistribution(sequence.list = list(aaseqtab$CDR3_IMGT, 
     aaseqtab2$CDR3_IMGT), names = c("IndA", "IndB"), numberSeq = FALSE, nrCores = 1)
## Not run: 
##D plotCompareAADistribution(comp.tab = AAdistr.comp, plotSeqN = FALSE, PDF = "Example")
## End(Not run)



