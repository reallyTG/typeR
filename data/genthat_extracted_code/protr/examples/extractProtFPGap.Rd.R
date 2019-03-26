library(protr)


### Name: extractProtFPGap
### Title: Amino Acid Properties Based Scales Descriptors (Protein
###   Fingerprint) with Gap Support
### Aliases: extractProtFPGap
### Keywords: AAindex extract gap scales

### ** Examples

# amino acid sequence with gaps
x = readFASTA(system.file("protseq/align.fasta", package = "protr"))$`IXI_235`
fp = extractProtFPGap(
  x, index = c(160:165, 258:296), pc = 5, lag = 7, silent = FALSE)



