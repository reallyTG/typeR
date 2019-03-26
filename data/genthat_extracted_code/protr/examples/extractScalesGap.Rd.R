library(protr)


### Name: extractScalesGap
### Title: Scales-Based Descriptors derived by Principal Components
###   Analysis (with Gap Support)
### Aliases: extractScalesGap
### Keywords: PCA PCM extract gap scales

### ** Examples

# amino acid sequence with gaps
x = readFASTA(system.file("protseq/align.fasta", package = "protr"))$`IXI_235`
data(AAindex)
AAidxmat = t(na.omit(as.matrix(AAindex[, 7:26])))
scales = extractScalesGap(x, propmat = AAidxmat, pc = 5, lag = 7, silent = FALSE)



