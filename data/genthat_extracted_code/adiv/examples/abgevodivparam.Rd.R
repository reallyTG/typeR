library(adiv)


### Name: abgevodivparam
### Title: Apportionment of Parametric Indices of Phylogenetic Diversity
### Aliases: abgevodivparam plot.abgevodivparam
### Keywords: models

### ** Examples

data(batcomm)
phy <- read.tree(text=batcomm$tre)
ab <- batcomm$ab[,phy$tip.label]
abgevodivparam(phy, ab)
plot(abgevodivparam(phy, ab))
abgevodivparam(phy, ab, q=0:4)
plot(abgevodivparam(phy, ab, q=0:4))



