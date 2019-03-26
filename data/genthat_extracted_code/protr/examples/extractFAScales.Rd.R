library(protr)


### Name: extractFAScales
### Title: Scales-Based Descriptors derived by Factor Analysis
### Aliases: extractFAScales
### Keywords: Factor PCM extract

### ** Examples

x = readFASTA(system.file("protseq/P00750.fasta", package = "protr"))[[1]]
data(AATopo)
tprops = AATopo[, c(37:41, 43:47)]  # select a set of topological descriptors
fa = extractFAScales(
  x, propmat = tprops, factors = 5, lag = 7, silent = FALSE)



