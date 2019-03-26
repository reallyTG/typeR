library(ChemoSpec)


### Name: normSpectra
### Title: Normalize a Spectra Object
### Aliases: normSpectra
### Keywords: manip utilities

### ** Examples


data(SrE.IR)

# Default PQN normalization
res1 <- normSpectra(SrE.IR)
plotSpectra(res1) # compare to plotSpectra(SrE.IR)

# Norm over carbonyl region
RE <- SrE.IR$freq > 1650 & SrE.IR$freq < 1800
res2 <- normSpectra(SrE.IR, method = "Range", RangeExpress = RE)
plotSpectra(res2) # compare to plotSpectra(SrE.IR)

# Check numerically
rowSums(res2$data[,RE]) # compare to rowSums(SrE.IR$data[,RE])
 



