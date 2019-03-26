library(protr)


### Name: extractMDSScales
### Title: Scales-Based Descriptors derived by Multidimensional Scaling
### Aliases: extractMDSScales
### Keywords: MDS PCM extract

### ** Examples

x = readFASTA(system.file("protseq/P00750.fasta", package = "protr"))[[1]]
data(AATopo)
tprops = AATopo[, c(37:41, 43:47)]  # select a set of topological descriptors
mds = extractMDSScales(x, propmat = tprops, k = 5, lag = 7, silent = FALSE)



