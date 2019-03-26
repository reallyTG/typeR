library(protr)


### Name: twoSeqSim
### Title: Protein Sequence Alignment for Two Protein Sequences
### Aliases: twoSeqSim
### Keywords: alignment parallel similarity

### ** Examples

## Not run: 
##D # Be careful when testing this since it involves sequence alignment
##D # and might produce unpredictable results in some environments
##D library("Biostrings")
##D s1 = readFASTA(system.file("protseq/P00750.fasta", package = "protr"))[[1]]
##D s2 = readFASTA(system.file("protseq/P10323.fasta", package = "protr"))[[1]]
##D seqalign = twoSeqSim(s1, s2)
##D summary(seqalign)
##D print(seqalign@score)
## End(Not run)



