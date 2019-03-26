library(adegraphics)


### Name: s1d.barchart
### Title: 1-D plot of a numeric score by bars
### Aliases: s1d.barchart
### Keywords: aplot hplot

### ** Examples

data(rpjdl, package = "ade4")
rpjdl.coa <- ade4::dudi.coa(rpjdl$fau, scannf = FALSE, nf = 4)
s1d.barchart(rpjdl.coa$eig, p1d.horizontal = FALSE, ppolygons.col = "grey")



