library(protr)


### Name: extractDescScales
### Title: Scales-Based Descriptors with 20+ classes of Molecular
###   Descriptors
### Aliases: extractDescScales
### Keywords: PCM extract scales

### ** Examples

x = readFASTA(system.file("protseq/P00750.fasta", package = "protr"))[[1]]
descscales = extractDescScales(
  x, propmat = "AATopo", index = c(37:41, 43:47),
  pc = 5, lag = 7, silent = FALSE)



