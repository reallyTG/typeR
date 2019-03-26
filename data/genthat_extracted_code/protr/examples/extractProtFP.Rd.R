library(protr)


### Name: extractProtFP
### Title: Amino Acid Properties Based Scales Descriptors (Protein
###   Fingerprint)
### Aliases: extractProtFP
### Keywords: AAindex extract scales

### ** Examples

x = readFASTA(system.file("protseq/P00750.fasta", package = "protr"))[[1]]
fp = extractProtFP(
  x, index = c(160:165, 258:296), pc = 5, lag = 7, silent = FALSE)



