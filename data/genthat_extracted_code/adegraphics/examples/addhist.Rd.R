library(adegraphics)


### Name: addhist
### Title: Adds histograms and density lines against a bi-dimensional
###   graphics.
### Aliases: addhist addhist-methods addhist,ADEg.S2-method
### Keywords: aplot

### ** Examples

data(rpjdl, package = "ade4")
coa1 <- ade4::dudi.coa(rpjdl$fau, scannf = FALSE, nf = 4)
labli <- s.label(coa1$li)
g1 <- addhist(labli)
g2 <- addhist(labli, plabels.cex = 0, cbreaks = 3)
labco <- s.label(coa1$co)
g3 <- addhist(labco, plabels.cex = 0, cbreaks = 3)
update(g3, pbackground.col = "grey85")



