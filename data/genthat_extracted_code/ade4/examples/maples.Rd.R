library(ade4)


### Name: maples
### Title: Phylogeny and quantitative traits of flowers
### Aliases: maples
### Keywords: datasets

### ** Examples

data(maples)
phy <- newick2phylog(maples$tre)
dom <- maples$tab$Dom
bif <- maples$tab$Bif
if (requireNamespace("adephylo", quietly = TRUE) & requireNamespace("ape", quietly = TRUE)) {
  phylo <- ape::read.tree(text = maples$tre)
  adephylo::orthogram(dom, tre = phylo)
  adephylo::orthogram(bif, tre = phylo)
  par(mfrow = c(1, 2))
  dotchart.phylog(phy, dom)
  dotchart.phylog(phy, bif, clabel.nodes = 0.7)
  par(mfrow = c(1, 1))
  plot(bif, dom, pch = 20)
  abline(lm(dom~bif))
  summary(lm(dom~bif))
  cor.test(bif, dom)
  pic.bif <- ape::pic(bif, phylo)
  pic.dom <- ape::pic(dom, phylo)
  cor.test(pic.bif, pic.dom)
}



