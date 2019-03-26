library(spider)


### Name: bestCloseMatch
### Title: Measures of identification accuracy
### Aliases: bestCloseMatch
### Keywords: Barcoding

### ** Examples



data(anoteropsis)
anoDist <- ape::dist.dna(anoteropsis)
anoSpp <- sapply(strsplit(dimnames(anoteropsis)[[1]], split = "_"), 
    function(x) paste(x[1], x[2], sep = "_"))

bestCloseMatch(anoDist, anoSpp)
bestCloseMatch(anoDist, anoSpp, threshold = 0.005)
nearNeighbour(anoDist, anoSpp)
nearNeighbour(anoDist, anoSpp, names = TRUE)
threshID(anoDist, anoSpp)
threshID(anoDist, anoSpp, threshold = 0.003)

data(dolomedes)
doloDist <- ape::dist.dna(dolomedes)
doloSpp <- substr(dimnames(dolomedes)[[1]], 1, 5)

bestCloseMatch(doloDist, doloSpp)
bestCloseMatch(doloDist, doloSpp, threshold = 0.005)
nearNeighbour(doloDist, doloSpp)
nearNeighbour(doloDist, doloSpp, names=TRUE)
threshID(doloDist, doloSpp)
threshID(doloDist, doloSpp, threshold = 0.003)




