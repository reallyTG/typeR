library(ChemoSpec)


### Name: hmapSpectra
### Title: Seriated Heat Map for a Spectra Object
### Aliases: hmapSpectra
### Keywords: multivariate

### ** Examples


data(SrE.IR)
# Let's look just at the carbonyl region
IR <- removeFreq(SrE.IR, rem.freq = SrE.IR$freq > 1850 | SrE.IR$freq < 1650)
res <- hmapSpectra(IR, col = heat.colors(5), labCol = FALSE)




