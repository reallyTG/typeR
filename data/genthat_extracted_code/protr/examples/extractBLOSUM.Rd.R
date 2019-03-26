library(protr)


### Name: extractBLOSUM
### Title: BLOSUM and PAM Matrix-Derived Descriptors
### Aliases: extractBLOSUM
### Keywords: BLOSUM PAM PCM extract

### ** Examples

x = readFASTA(system.file("protseq/P00750.fasta", package = "protr"))[[1]]
blosum = extractBLOSUM(
  x, submat = "AABLOSUM62", k = 5, lag = 7, scale = TRUE, silent = FALSE)



