library(ade4)


### Name: scatter
### Title: Graphical representation of the outputs of a multivariate
###   analysis
### Aliases: scatter biplot.dudi screeplot.dudi
### Keywords: multivariate hplot

### ** Examples

data(rpjdl)
rpjdl.coa <- dudi.coa(rpjdl$fau, scannf = FALSE, nf = 4)
screeplot(rpjdl.coa)
biplot(rpjdl.coa)



