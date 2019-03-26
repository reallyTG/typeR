library(adiv)


### Name: evodivparam
### Title: Parametric Indices of Phylogenetic Diversity
### Aliases: evodivparam plot.evodivparam
### Keywords: models

### ** Examples

data(batcomm)
phy <- read.tree(text=batcomm$tre)
ab <- batcomm$ab[, phy$tip.label]
plot(evodivparam(phy, ab))
plot(evodivparam(phy, ab, q=seq(0, 10, length=20)))



