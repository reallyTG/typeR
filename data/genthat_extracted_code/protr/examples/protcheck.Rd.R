library(protr)


### Name: protcheck
### Title: Protein sequence amino acid type sanity check
### Aliases: protcheck
### Keywords: check

### ** Examples

x = readFASTA(system.file("protseq/P00750.fasta", package = "protr"))[[1]]
protcheck(x)  # TRUE
protcheck(paste(x, "Z", sep = ""))  # FALSE



