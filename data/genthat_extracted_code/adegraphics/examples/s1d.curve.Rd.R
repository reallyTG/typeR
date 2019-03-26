library(adegraphics)


### Name: s1d.curve
### Title: 1-D plot of a numeric score linked by curves
### Aliases: s1d.curve
### Keywords: aplot hplot

### ** Examples

data(rpjdl, package = "ade4")
rpjdl.coa <- ade4::dudi.coa(rpjdl$fau, scannf = FALSE, nf = 4)
s1d.curve(rpjdl.coa$eig)

set.seed(40)
score1 <- rnorm(10)
s1d.curve(score1)



