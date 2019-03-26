library(adegraphics)


### Name: s1d.dotplot
### Title: 1-D plot of a numeric score by dots
### Aliases: s1d.dotplot
### Keywords: aplot hplot

### ** Examples

data(rpjdl, package = "ade4")
rpjdl.coa <- ade4::dudi.coa(rpjdl$fau, scannf = FALSE, nf = 4)
s1d.dotplot(rpjdl.coa$eig)

set.seed(40)
score1 <- rnorm(10)
s1d.dotplot(score1)



