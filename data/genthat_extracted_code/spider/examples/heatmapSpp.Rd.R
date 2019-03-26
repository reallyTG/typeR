library(spider)


### Name: heatmapSpp
### Title: Visualise a distance matrix using a heatmap
### Aliases: heatmapSpp
### Keywords: Utilities

### ** Examples


data(dolomedes)
doloDist <- ape::dist.dna(dolomedes, model = "raw")
doloSpp <- substr(dimnames(dolomedes)[[1]], 1, 5)
heatmapSpp(doloDist, doloSpp)
heatmapSpp(doloDist, doloSpp, axisLabels = dimnames(dolomedes)[[1]])

data(anoteropsis)
anoDist <- ape::dist.dna(anoteropsis, model = "raw")
anoSpp <- sapply(strsplit(dimnames(anoteropsis)[[1]], split="_"), 
    function(x) paste(x[1], x[2], sep="_"))
heatmapSpp(anoDist, anoSpp)
heatmapSpp(anoDist, anoSpp, showData = TRUE)
heatmapSpp(anoDist, anoSpp, showData = TRUE, dataRound = 1, dataCEX = 0.4)
heatmapSpp(anoDist, anoSpp, triangle = "upper")
heatmapSpp(anoDist, anoSpp, triangle = "lower")
heatmapSpp(anoDist, anoSpp, triangle = "lower", showData = TRUE, dataRound = 1, dataCEX = 0.4)





