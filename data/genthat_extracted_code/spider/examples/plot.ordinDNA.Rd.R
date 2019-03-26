library(spider)


### Name: plot.ordinDNA
### Title: Plot an 'ordinDNA' object
### Aliases: plot.ordinDNA
### Keywords: Visualisation

### ** Examples


data(dolomedes)
doloDist <- ape::dist.dna(dolomedes)
doloSpp <- substr(dimnames(dolomedes)[[1]], 1, 5)

doloOrd <- ordinDNA(doloDist, doloSpp)

graphics::plot(doloOrd)
graphics::plot(doloOrd, majorAxes = c(1,3))
graphics::plot(doloOrd, textcex = 0.001)
graphics::plot(doloOrd, plotCol = c("#FF0000", "#00FF00", "#0000FF"))
graphics::plot(doloOrd, namesPos = "bottom")
graphics::plot(doloOrd, namesPos = "centre")

data(anoteropsis)
anoDist <- ape::dist.dna(anoteropsis)
anoSpp <- sapply(strsplit(dimnames(anoteropsis)[[1]], split="_"), 
    function(x) paste(x[1], x[2], sep="_"))
    
anoOrd <- ordinDNA(anoDist, anoSpp)

plot(anoOrd, sppBounds = "circles")




