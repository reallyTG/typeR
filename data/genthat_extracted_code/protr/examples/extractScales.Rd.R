library(protr)


### Name: extractScales
### Title: Scales-Based Descriptors derived by Principal Components
###   Analysis
### Aliases: extractScales
### Keywords: PCA PCM extract scales

### ** Examples

x = readFASTA(system.file("protseq/P00750.fasta", package = "protr"))[[1]]
data(AAindex)
AAidxmat = t(na.omit(as.matrix(AAindex[, 7:26])))
scales = extractScales(x, propmat = AAidxmat, pc = 5, lag = 7, silent = FALSE)



