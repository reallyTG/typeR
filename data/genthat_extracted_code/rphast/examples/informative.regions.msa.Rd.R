library(rphast)


### Name: informative.regions.msa
### Title: Get informative regions of an alignment
### Aliases: informative.regions.msa
### Keywords: msa

### ** Examples

require("rphast")
m <- msa(seqs=c("A--ACGTAT-", "AG-AGGTAA-", "AGGAGGTA--"),
         names=c("human", "mouse", "rat"))
informative.regions.msa(m, 1, refseq=NULL)
informative.regions.msa(m, 3, refseq=NULL)
informative.regions.msa(m, 3, refseq="mouse", spec=c("mouse", "rat"))



