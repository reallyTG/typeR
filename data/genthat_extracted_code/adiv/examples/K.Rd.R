library(adiv)


### Name: K
### Title: Indices K, Kstar and Kw of Phylogenetic Signal
### Aliases: K Kstar Kw
### Keywords: models

### ** Examples

data(rockfish)
phy <- read.tree(text=rockfish$tre)
K(phy, rockfish$traits[phy$tip.label, 1])
Kstar(phy, rockfish$traits[phy$tip.label, 1])
Kw(phy, rockfish$traits[phy$tip.label, 1])



